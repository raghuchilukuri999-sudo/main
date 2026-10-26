public class AssignTaskToCaseOwner implements Queueable {
    
    // Instance variables
    public List<Case> closedWonCases;
    
    // Constructor
    public AssignTaskToCaseOwner(List<Case> cases) {
        // Assign the input parameter to the instance variable
        closedWonCases = cases;
    }
    
    public void execute(QueueableContext qc) {
        // Create a list to bulk insert the Tasks
        List<Task> taskList = new List<Task>();
        
        // Iterate through the Cases that are created for the ClosedWonDeals and those which passed from the first Queueable job
        for (Case csIterate : closedWonCases) {
            // For each Case created for the closed deals, create a Task and assign it to the Case owner
            Task t = new Task();
            DateTime caseCreatedDateTime = csIterate.CreatedDate;
            t.ActivityDate = caseCreatedDateTime.date().addDays(3);
            t.Description = csIterate.Description;
            t.OwnerId = csIterate.OwnerId;
            t.Priority = csIterate.Priority;
            t.Status = 'Not Started';
            t.Subject = csIterate.Subject;
            // Associate the Task to the Case
            t.WhatId = csIterate.Id;
            // Add each Task to the taskList
            taskList.add(t);
        }

        // Insert the tasks if the taskList is not empty
        if (!taskList.isEmpty()) {
            insert taskList;
        } else {
            System.debug('No tasks created.');
        }
    }
}