public class AccountTriggerHandler implements ITrigger{

   
   
    public AccountTriggerHandler(){
    }
 
    
    public void bulkBefore(){
		// If this a delete trigger Cache a list of Account Id's that are 'in use'
    }
     
    public void bulkAfter(){
    }
         
    public void beforeInsert(){
    	List<Account> listAc = (list<Account>) trigger.new ;  
        
        system.debug('before insert account');
    }
     
    public void beforeUpdate(){
    	system.debug('before Update account');
    }
     
    /**
     * beforeDelete
     *
     * This method is called iteratively for each record to be deleted during a BEFORE
     * trigger.
     */
    public void beforeDelete(){  
		system.debug('before delete account');
    }
     
    public void afterInsert(){
        system.debug('after insert account');
    }
     
    public void afterUpdate(){
    	    	system.debug('after update account');
        
        List<Account> listAc = (list<Account>) trigger.new ; 
        
        Set<ID> acIDtoSendDetails = new Set<ID>  ();
        
        
        for(Account ac: listAc){
            
            if(ac.AnnualRevenue>5000000){
                acIDtoSendDetails.add(ac.Id);
                
            }
            
        }
        
        
        
        
        
        Utility.sendAccoutDetails(acIDtoSendDetails);
        
    }
     
    public void afterDelete(){
    	system.debug('after delete account');
    }

    public void afterUnDelete(){
    		system.debug('after undelete account');
    }
     
    /**
     * andFinally
     *
     * This method is called once all records have been processed by the trigger. Use this
     * method to accomplish any final operations such as creation or updates of other records.
     */
    public void andFinally(){
        // insert any audit records

    }


	
}