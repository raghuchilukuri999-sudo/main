public with sharing class RecordandTranscribeEventTriggerHandler {

    public static void handleBeforeSave(List<Event> events) {
        RecordandTranscribeEventHelper.setDefaultStatus(events);
    }


    public static void handleContentDocumentLinkAfterInsert(List<ContentDocumentLink> newLinks) {
        RecordandTranscribeEventHelper.autoCheckOutFromManualFileUpload(newLinks);
    }
}