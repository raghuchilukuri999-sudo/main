@istest
private class EmailupdateValidateTestClass {
    @istest
    private static void unittest(){
        contact con = new contact();
        con.firstName = 'Veeraiah';
        con.Lastname = 'valtier';
        con.Email = 'valtierveeraiah4548@gmail.com';
        insert con;
        
        //updating the inserted contact email
        con.email = 'veeraiahvaltier4463@gmail.com';
          
        try {
            update con;
        } 
        catch (DmlException e) {
            // Check if the error message is as expected
             System.assertEquals(true, e.getMessage().contains('Contact email cannot be changed once it is provided.'));
        }
        
       
    }

}