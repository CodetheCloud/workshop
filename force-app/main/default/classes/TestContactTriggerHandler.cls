@isTest
private class TestContactTriggerHandler {

    @isTest
    private static void doTestContact(){
        
        Account ac = new Account();
        ac.Name = 'TestAc';
        ac.AnnualRevenue= 500000;
        insert ac;
        
        
        Contact c = new Contact();
        c.AccountId= ac.Id;
        c.LastName = 'test name';
        insert c;
        
        c.LastName = 'change test name';
        
        update c;
        
        delete c;
        
        
        
        
        
    }
    
    
    
}