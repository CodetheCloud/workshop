trigger AccountTrigger on Account (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    
    TriggerFactory.createHandler(Account.sObjectType);
    
}