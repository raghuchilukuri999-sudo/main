public class CaseCountHandlerClass {
    
    @Future
    // We use Future Annotation for Future Methods
    public static void countCases(Set<Id> accountIds) {
        // Create a list to bulk update the Accounts
        List<Account> accList = new List<Account>();
        // Create a Map to store the AccountIds in the key and another Map to store the Case Status in the key and its value in the value of the inner Map
        Map<Id, Map<String, Integer>> accCaseCountMap = new Map<Id, Map<String, Integer>>();
        // Iterate through the AccountIds
        for (Id accId : accountIds) {
            // Initializing the inner Map by passing the closed and open strings to the key and their values to the value of the Map
            Map<String, Integer> innerCaseCountMap = new Map<String, Integer>{'open' => 0, 'closed' => 0};
            // Add each AccountId to the key of the Map and pass the inner Map to the value of the outer Map
            accCaseCountMap.put(accId, innerCaseCountMap);
        }
        // Fetch the Cases for the Accounts that are passed from the trigger and iterate through those cases
        for (Case cs : [SELECT Id, CaseNumber, Status, AccountId FROM Case WHERE AccountId IN :accountIds]) {
            // Check if the case status is open
            if (cs.Status != 'closed') {
                accCaseCountMap.get(cs.AccountId).put('open', accCaseCountMap.get(cs.AccountId).get('open') + 1);
            } else {
                accCaseCountMap.get(cs.AccountId).put('closed', accCaseCountMap.get(cs.AccountId).get('closed') + 1);
            }
        }
        // Iterate through the AccountIds
        for (Id accId : accountIds) {
            // Get the instance of the Account
            Account acc = new Account(Id = accId);
            // Set the count of open cases
            acc.No_of_open_Cases__c = accCaseCountMap.get(accId).get('open');
            // Set the count of closed cases
            acc.No_of_closed_Cases__c = accCaseCountMap.get(accId).get('closed');
            // Set the count of total cases
            acc.Total_No_of_cases__c = accCaseCountMap.get(accId).get('open') + accCaseCountMap.get(accId).get('closed');
            // Add each Account to the Account list
            accList.add(acc);
        }
        // Check if there are any Accounts in the list
        if (!accList.isEmpty()) {
            update accList;
        }
    }

}