public with sharing class RecordandTranscribeEventHelper {

    // Bypasses the automatic "mark Checked Out on file upload" behavior in
    // autoCheckOutFromManualFileUpload while a recording is actively chunk-uploading.
    // Interim audio/transcript files land on the Event via FirstPublishLocationId the
    // same way a manual upload would, so without this flag the very first chunk would
    // prematurely flip the Event to "Checked Out" mid-meeting, before the user has
    // actually stopped recording.
    public static Boolean bypassAutoCheckoutOnUpload = false;

    public static void setDefaultStatus(List<Event> events) {
        for (Event evt : events) {
            if (evt.StartDateTime != null && evt.EndDateTime != null && String.isBlank(evt.Meeting_Status__c)) {
                evt.Meeting_Status__c = 'Scheduled';
            }
        }
    }

    @AuraEnabled
    public static List<EventWrapper> getRelatedEvents(Id parentId) {
        List<EventWrapper> result = new List<EventWrapper>();
        for (Event evt : queryEvents(parentId, true)) {
            result.add(new EventWrapper(evt));
        }
        return result;
    }

    @AuraEnabled
    public static EventWrapper updateEventStatus(Id eventId, String action, Decimal latitude, Decimal longitude) {
        Event evt = new Event(Id = eventId);
        String locationName = resolveLocationName(latitude, longitude);

        if (action == 'checkIn') {
            evt.Check_In_Date_Time__c = System.now();
            evt.Check_In_Location__c = locationName;
            evt.Meeting_Status__c = 'Checked In';
        } else if (action == 'checkOut') {
            evt.Check_Out_Date_Time__c = System.now();
            evt.Check_Out_Location__c = locationName;
            evt.Meeting_Status__c = 'Checked Out';
        }

        update evt;
        return new EventWrapper(queryEvents(eventId, false)[0]);
    }

    @AuraEnabled
    public static EventWrapper cancelEvent(Id eventId, String cancellationReason, String otherComments) {
        Event evt = new Event(Id = eventId);
        evt.Meeting_Status__c = 'Cancelled';
        evt.Cancellation_Reason__c = cancellationReason;
        evt.Cancellation_Reschedule_Comments__c = (cancellationReason == 'Other') ? otherComments : null;

        update evt;
        return new EventWrapper(queryEvents(eventId, false)[0]);
    }

    @AuraEnabled
    public static EventWrapper rescheduleEvent(Id eventId, Datetime newStart, Datetime newEnd, String comments) {
        Event oldEvt = [
            SELECT Id, Subject, Description, WhoId, WhatId
            FROM Event
            WHERE Id = :eventId
            LIMIT 1
        ];

        Event newEvt = new Event(
            Subject = oldEvt.Subject,
            Description = oldEvt.Description,
            WhoId = oldEvt.WhoId,
            WhatId = oldEvt.WhatId,
            StartDateTime = newStart,
            EndDateTime = newEnd,
            Cancellation_Reschedule_Comments__c = comments
        );
        insert newEvt;

        oldEvt.Meeting_Status__c = 'Rescheduled As New Event';
        update oldEvt;

        return new EventWrapper(queryEvents(newEvt.Id, false)[0]);
    }

    private static String resolveLocationName(Decimal latitude, Decimal longitude) {

        if (latitude == null || longitude == null) {
            return 'Location Unavailable';
        }

        try {
            String location = getAreaName(latitude, longitude);
            if (String.isNotBlank(location)) {
                return location;
            }
        } catch (Exception ex) {
            System.debug('Reverse Geocoding Error: ' + ex.getMessage());
        }

        return 'Latitude: ' + latitude + ', Longitude: ' + longitude;
    }

    private static String getAreaName(Decimal lat, Decimal lng) {

        String endpoint =
            'https://nominatim.openstreetmap.org/reverse'
            + '?format=jsonv2'
            + '&lat=' + EncodingUtil.urlEncode(String.valueOf(lat), 'UTF-8')
            + '&lon=' + EncodingUtil.urlEncode(String.valueOf(lng), 'UTF-8')
            + '&zoom=18'
            + '&addressdetails=1';

        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setTimeout(20000);

        req.setHeader('User-Agent', 'Salesforce Event CheckIn App');
        req.setHeader('Accept', 'application/json');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() != 200) {
            return null;
        }

        Map<String,Object> response =
            (Map<String,Object>) JSON.deserializeUntyped(res.getBody());

        if (response == null) {
            return null;
        }

        Map<String,Object> address =
            (Map<String,Object>) response.get('address');

        List<String> parts = new List<String>();

        if (address != null) {
            addPart(parts, address, 'house_number');
            addPart(parts, address, 'building');
            addPart(parts, address, 'amenity');
            addPart(parts, address, 'office');
            addPart(parts, address, 'road');
            addPart(parts, address, 'residential');
            addPart(parts, address, 'neighbourhood');
            addPart(parts, address, 'suburb');
            addPart(parts, address, 'city_district');
            addPart(parts, address, 'city');
            addPart(parts, address, 'town');
            addPart(parts, address, 'village');
            addPart(parts, address, 'county');
            addPart(parts, address, 'state_district');
            addPart(parts, address, 'state');
            addPart(parts, address, 'postcode');
            addPart(parts, address, 'country');
        }

        if (!parts.isEmpty()) {
            return String.join(parts, ', ');
        }

        if (response.containsKey('display_name')) {
            return String.valueOf(response.get('display_name'));
        }

        return null;
    }

    private static void addPart(
        List<String> parts,
        Map<String,Object> address,
        String key
    ) {
        if (address.containsKey(key)) {
            String value = String.valueOf(address.get(key));
            if (String.isNotBlank(value) && !parts.contains(value)) {
                parts.add(value);
            }
        }
    }

    public static void autoCheckOutFromManualFileUpload(List<ContentDocumentLink> newLinks) {
        if (bypassAutoCheckoutOnUpload) {
            return;
        }

        Set<Id> candidateEventIds = new Set<Id>();

        for (ContentDocumentLink link : newLinks) {
            if (link.LinkedEntityId.getSObjectType() == Event.SObjectType) {
                candidateEventIds.add(link.LinkedEntityId);
            }
        }

        if (candidateEventIds.isEmpty()) {
            return;
        }

        List<Event> eventsToUpdate = new List<Event>();

        for (Event evt : [
            SELECT Id, Meeting_Status__c
            FROM Event
            WHERE Id IN :candidateEventIds
        ]) {
            if (evt.Meeting_Status__c != 'Cancelled'
                && evt.Meeting_Status__c != 'Checked Out'
                && evt.Meeting_Status__c != 'Rescheduled As New Event') {
                eventsToUpdate.add(new Event(
                    Id = evt.Id,
                    Meeting_Status__c = 'Checked Out',
                    Check_Out_Date_Time__c = System.now(),
                    Check_Out_Location__c = 'Manually Uploaded (no location captured)'
                ));
            }
        }

        if (!eventsToUpdate.isEmpty()) {
            update eventsToUpdate;
        }
    }

    private static List<Event> queryEvents(Id filterId, Boolean byParent) {
        String query = 'SELECT Id, Subject, StartDateTime, EndDateTime, OwnerId, Owner.Name, WhoId, WhatId, ' +
            'Meeting_Status__c, Check_In_Date_Time__c, Check_Out_Date_Time__c, ' +
            'Check_In_Location__c, Check_Out_Location__c, Description, ' +
            'Cancellation_Reason__c, Cancellation_Reschedule_Comments__c ' +
            'FROM Event WHERE ' + (byParent
                ? 'WhatId = :filterId AND Meeting_Status__c NOT IN (\'Rescheduled As New Event\', \'Cancelled\', \'Checked Out\') ORDER BY CreatedDate DESC'
                : 'Id = :filterId LIMIT 1');
        return Database.query(query);
    }

    public class EventWrapper {
        @AuraEnabled public Id eventId;
        @AuraEnabled public String subject;
        @AuraEnabled public Datetime startDateTime;
        @AuraEnabled public Datetime endDateTime;
        @AuraEnabled public String ownerName;
        @AuraEnabled public String meetingStatus;
        @AuraEnabled public Datetime checkInDateTime;
        @AuraEnabled public Datetime checkOutDateTime;
        @AuraEnabled public String checkInLocation;
        @AuraEnabled public String checkOutLocation;
        @AuraEnabled public String description;
        @AuraEnabled public String cancellationReason;
        @AuraEnabled public String cancellationComments;

        public EventWrapper(Event evt) {
            this.eventId = evt.Id;
            this.subject = evt.Subject;
            this.startDateTime = evt.StartDateTime;
            this.endDateTime = evt.EndDateTime;
            this.ownerName = evt.Owner != null ? evt.Owner.Name : null;
            this.meetingStatus = evt.Meeting_Status__c;
            this.checkInDateTime = evt.Check_In_Date_Time__c;
            this.checkOutDateTime = evt.Check_Out_Date_Time__c;
            this.checkInLocation = evt.Check_In_Location__c;
            this.checkOutLocation = evt.Check_Out_Location__c;
            this.description = evt.Description;
            this.cancellationReason = evt.Cancellation_Reason__c;
            this.cancellationComments = evt.Cancellation_Reschedule_Comments__c;
        }
    }

    // Wrapper so the client can track the transcript file's ContentDocumentId across
    // successive chunk calls (needed so each new chunk adds a *version* to the same
    // transcript file instead of creating a new file every time).
    public class ChunkSaveResult {
        @AuraEnabled public Boolean success;
        @AuraEnabled public Id transcriptContentDocumentId;

        public ChunkSaveResult(Boolean success, Id transcriptContentDocumentId) {
            this.success = success;
            this.transcriptContentDocumentId = transcriptContentDocumentId;
        }
    }

    /**
     * Saves one completed, independently-playable audio segment (and the latest
     * transcript snapshot) during an in-progress or just-finished recording.
     *
     * - Every segment sent here is a COMPLETE, valid WebM file on its own (the client
     *   rotates its MediaRecorder rather than using a single continuous recorder with
     *   timeslice fragments, which is what previously produced unplayable files past
     *   the first segment).
     * - base64Data/fileName will be present even on the final call (isFinalChunk =
     *   true covers the last segment recorded up to Stop & Save), so the very last
     *   few seconds/minutes of audio are never dropped.
     * - transcriptContentDocumentId should be null on the very first call, then the
     *   value returned from that call on every subsequent call.
     */
    @AuraEnabled
    public static ChunkSaveResult saveRecordingChunk(
        Id parentId,
        String base64Data,
        String fileName,
        String transcript,
        Id transcriptContentDocumentId,
        Boolean isFinalChunk
    ) {
        // Interim segments land on the Event the same way a manual file upload would.
        // Suppress the auto-checkout side effect until the meeting has actually ended
        // (on the final chunk, the Event is already Checked Out by then anyway, so
        // this flag being false is harmless).
        bypassAutoCheckoutOnUpload = !isFinalChunk;

        if (String.isNotBlank(base64Data)) {
            Blob audioBlob = EncodingUtil.base64Decode(base64Data);
            ContentVersion cv = new ContentVersion(
                Title = fileName,
                PathOnClient = fileName,
                VersionData = audioBlob,
                FirstPublishLocationId = parentId
            );
            insert cv;
        }

        Id updatedTranscriptDocId = transcriptContentDocumentId;
        if (String.isNotBlank(transcript)) {
            updatedTranscriptDocId = upsertTranscriptVersion(parentId, transcriptContentDocumentId, transcript);
        }

        if (isFinalChunk) {
            Event evt = [
                SELECT Id, WhatId
                FROM Event
                WHERE Id = :parentId
                LIMIT 1
            ];

            if (evt.WhatId != null &&
                evt.WhatId.getSObjectType() == Opportunity.SObjectType) {

                Opportunity opp = new Opportunity(
                    Id = evt.WhatId,
                    Transcript__c = transcript
                );
                update opp;
            }
        }

        return new ChunkSaveResult(true, updatedTranscriptDocId);
    }

    // Creates the transcript file on its first call (linked to the Event), then adds a
    // new version of that same file on every subsequent call, so the meeting ends up
    // with one transcript file (with version history) rather than many separate files.
    private static Id upsertTranscriptVersion(Id parentId, Id existingContentDocumentId, String transcript) {
        String fileName = 'Transcript.txt';

        ContentVersion cv = new ContentVersion(
            Title = fileName,
            PathOnClient = fileName,
            VersionData = Blob.valueOf(transcript)
        );

        if (existingContentDocumentId != null) {
            cv.ContentDocumentId = existingContentDocumentId;
            insert cv;
            return existingContentDocumentId;
        }

        cv.FirstPublishLocationId = parentId;
        insert cv;

        ContentVersion inserted = [
            SELECT ContentDocumentId
            FROM ContentVersion
            WHERE Id = :cv.Id
            LIMIT 1
        ];
        return inserted.ContentDocumentId;
    }
}