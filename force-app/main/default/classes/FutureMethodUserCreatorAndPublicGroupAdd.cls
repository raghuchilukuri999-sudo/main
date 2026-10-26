public class FutureMethodUserCreatorAndPublicGroupAdd {
    
    @future
    public static void userAdditionToPublicGroup(Set<Id> employeeIds) {
        
        //create a list to make bulk user insertion easy
        List<User> usersList = new List<User>();
        
        //create a map to store/add the Employee id in the key and the Employee Records as Values
        Map<Id, Employee__c> empMap = new Map<Id, Employee__c>();
        
        //create a list To make bulk groupmembers insertion easy
        List<GroupMember> groupMemList = new List<GroupMember>();
        
        //fetch the Employees Who are in The Employeeids set that We mentioned In The Input parameters of The method above
        List<Employee__c> empFetched = [SELECT Id, Name, Employee_Email__c, Employee_Associated_Car_Type__c, Employee_Associated_Car_Type__r.Name
                                        FROM Employee__c WHERE Id IN :employeeIds];
        
        //create a Map To Add/store The cartype id in The key and the Name as The Value
         Map<Id, String> carTypeNamesMap = new Map<Id, String>();
        
        //Now iterate Through The fetched Employees Whose Ids are in The Set Mentioned Above In The method
        for (Employee__c employee : empFetched) {
            //Now for those employees add the cartypeid and Name using The CartypeNamesmap
            carTypeNamesMap.put(employee.Employee_Associated_Car_Type__c, employee.Employee_Associated_Car_Type__r.Name);
            //now add these Employees id as the key and Records as The value 
            //Whose Ids are in The Set Mentioned Above In The method and who have Cartype name and its id To The Employee Map 
            empMap.put(employee.Id, employee);
        }
        
        //Again iterate Through The Fetched Employees and create users in Bulk and Add Them To The users list
        for (Employee__c employee : empFetched) {
            User newUser = new User();
            newUser.Username = employee.Employee_Email__c + '.' + String.valueOf(Math.random()).substring(2, 10); // Unique username
            newUser.Email = employee.Employee_Email__c;
            newUser.LastName = employee.Name;
            newUser.Alias = employee.Name.substring(0, Math.min(5, employee.Name.length()));
            newUser.TimeZoneSidKey = 'America/Los_Angeles';
            newUser.LocaleSidKey = 'en_US';
            newUser.EmailEncodingKey = 'UTF-8';
            newUser.LanguageLocaleKey = 'en_US';
            newUser.ProfileId = [SELECT Id FROM Profile WHERE Name = 'Force.com - Free User' LIMIT 1].Id;
            newUser.UserRoleId = null;
            newUser.IsActive = true;

            usersList.add(newUser);
        }

        if (!usersList.isEmpty()) {
            //bulk insert the users Using The Userlist
            insert usersList;

            //create a set To store The userEmails as The string
            Set<String> userEmails = new Set<String>();
            //iterate Through The userslist and add The Emails To The users In The userlist using the userEmails Set
            for (User user : usersList) {
                userEmails.add(user.Email);
            }

            //now fetch the inserted users of those whose Emails are in In The UserEmails Set
            List<User> insertedUsers = [SELECT Id, Email, Username FROM User WHERE Email IN :userEmails];
            //Now make The Email mapping of Inserted user With The inserted users Id
            Map<String, Id> emailToUserIdMap = new Map<String, Id>();
            //iterate Through The inserted users and add the Emailids and ids of The inserted users To the emailTouserIdmap For Mapping
            for (User insertedUser : insertedUsers) {
                emailToUserIdMap.put(insertedUser.Email, insertedUser.Id);
            }
            
            //Again iterate through The fetched Employees Whose Ids are in The Set Mentioned Above In The method
            for (Employee__c employee : empFetched) {
                
                //using the datatype id and varibale userid get the EmployeeEmail From the 
                //emailToUserIdMap(since the user and Employee Emails Are same we Are Fetching The Employee Emails)
                Id userId = emailToUserIdMap.get(employee.Employee_Email__c);
                
                //using string As The Datatype And The carTypename as The variable get The car Type of The Employee
                String carTypeName = carTypeNamesMap.get(employee.Employee_Associated_Car_Type__c);
                
                if (userId != null && carTypeName != null) {
                    Group publicGroup = [SELECT Id FROM Group WHERE Name = :carTypeName LIMIT 1];
                    if (publicGroup != null) {
                        GroupMember groupMember = new GroupMember();
                        groupMember.GroupId = publicGroup.Id;
                        groupMember.UserOrGroupId = userId;
                        groupMemList.add(groupMember);
                    }
                }
            }

            if (!groupMemList.isEmpty()) {
                insert groupMemList;
            }
        }
    }
}