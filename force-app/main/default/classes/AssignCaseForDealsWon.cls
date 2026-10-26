public class AssignCaseForDealsWon implements Queueable {
    
    // Instance variables
    public List<Opportunity> closedWonDeals;
    
    // Constructor
    public AssignCaseForDealsWon(List<Opportunity> opportunities) {
        // Assign the input parameter to the instance variable
        closedWonDeals = opportunities;
    }
    
    public void execute(QueueableContext qc) {
        
        // Create a list to bulk insert the Cases
        List<Case> caseList = new List<Case>();
        
        // Iterate through the closedWonDeals
        for(Opportunity opp : closedWonDeals) {
            // Skip the Opportunity if AccountId or OwnerId is null
            if (opp.AccountId == null || opp.OwnerId == null) {
                System.debug('Skipping Opportunity with ID ' + opp.Id + ' due to null AccountId or OwnerId.');
                continue;
            }
            
            // For each ClosedWonDeal, create a Case
            Case cs = new Case();
            cs.Status = 'New';
            cs.Priority = 'High';
            cs.Origin = 'Web';
            cs.Subject = 'Prepare the quote for the deal that is already won';
            cs.Description = 'Prepare the quote for the deal that is won ' + opp.Name + ' from the customer';
            cs.AccountId = opp.AccountId; // Setting the AccountId of the Opportunity to the Case as well
            cs.OwnerId = opp.OwnerId; // Setting the Case owner same as the Opportunity owner
            // Adding each Case created to the caseList in order to make the bulk insertion easy
            caseList.add(cs);
        }
        
        // Checking if the caseList is not empty
        if (!caseList.isEmpty()) {
            // Bulk inserting the Cases using caseList
            insert caseList;

            // Create an instance for the 2nd Queueable class, passing the caseList to its constructor
            AssignTaskToCaseOwner queueable2Instance = new AssignTaskToCaseOwner(caseList);
            
            // Calling the 2nd Queueable class here
            Id jobId = System.enqueueJob(queueable2Instance);
        } else {
            System.debug('No cases created.');
        }
    }
}