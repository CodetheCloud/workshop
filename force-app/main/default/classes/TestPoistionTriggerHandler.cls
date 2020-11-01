@isTest
Private class TestPoistionTriggerHandler {

    
    @isTest
    private static void doPositionTest(){
        
        Id UserID = UserInfo.getUserId();
        workshopday__Position__c pos = new workshopday__Position__c();
        pos.Name = 'test position';
        pos.workshopday__Job_Description__c ='Test Description for test';
        pos.workshopday__Hiring_Manager__c	 = UserID;
        insert pos;
        
        pos.workshopday__Job_Description__c = 'some other text';
        update pos;
        
        delete pos;
        
        
    }
    
    
}