public class DeleteLeadsBatchApexClass implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // Fetching all the Lead records whose Status is 'Closed-Notconverted'
        String query = 'SELECT Id, FirstName, LastName, Status FROM Lead WHERE Status = \'Closed-Notconverted\'';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> processedLeadRecords) {
        // Check if there are really any Lead records in the processedLeadRecords
        if (!processedLeadRecords.isEmpty()) {
            // Then delete the processedLeadRecords
            delete processedLeadRecords;
            
            // Also delete them in Recycle Bin
            Database.emptyRecycleBin(processedLeadRecords);
        }
    }
    
    public void finish(Database.BatchableContext bc) {
        // Optional finish method
    }
}