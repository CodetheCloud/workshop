@isTest
Private class TestAccountTriggerHandler {

    @isTest
    private static void doTestAccount(){
        Account ac = new Account();
        ac.Name = 'TestAc';
        ac.AnnualRevenue= 500000;
        insert ac;
        
        
        ac.AnnualRevenue = 600000;
        update ac;
        
        delete ac;
        
    }
    
    
    
}