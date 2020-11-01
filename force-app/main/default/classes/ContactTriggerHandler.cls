public class ContactTriggerHandler implements ITrigger{

    public ContactTriggerHandler(){
    }
 
    
      
    public void bulkBefore(){
		// If this a delete trigger Cache a list of Account Id's that are 'in use'
    }
     
    public void bulkAfter(){
    }
         
    public void beforeInsert(){
    	
        
		integer valueres = Utility.doAdd(5 , 10);   
        system.debug('added value is = '+ valueres );
        system.debug('before insert contact ok ok ok ok ok o kko o');
    }
     
    public void beforeUpdate(){
    	
   
        
    }
   
    public void beforeDelete(){  
		system.debug('before delete account');
    }
     
    public void afterInsert(){
        system.debug('after insert account');
    }
     
    public void afterUpdate(){
    	    	
    }
     
    public void afterDelete(){
    	system.debug('after delete account');
    }

    public void afterUnDelete(){
    		system.debug('after undelete account');
    }
     
 
    public void andFinally(){
        // insert any audit records

    }
    
    
    
    

    
}