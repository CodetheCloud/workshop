public class PoistionTriggerHandler implements ITrigger {
    
    
    
    public PoistionTriggerHandler(){
    }
 
    
    public void bulkBefore(){
		// If this a delete trigger Cache a list of Account Id's that are 'in use'
    }
     
    public void bulkAfter(){
    }
         
    public void beforeInsert(){
    	
        validateTemporaryDuration();
        restrictPoistionWOUTHiringManager();  //to validate
        system.debug('before insert poistion');
    }
     
    public void beforeUpdate(){
    	validateTemporaryDuration();
     	restrictPoistionWOUTHiringManager();  //to validate 
        
   
        
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

    
    public static void validateTemporaryDuration(){
        
        system.debug('validate temp duration method called');
        
        for(Position__c pos1: (list<Position__c>)  Trigger.New)  {
            
            system.debug('validate temp duration inside for loop');
            
            if(pos1.Type__c =='Temp' && ( pos1.Duration__c < 1 || pos1.Duration__c >365  || pos1.Duration__C == null) ) {
                		system.debug('condition matched. in side if stmt need to throw error');
                
                    pos1.addError('you need to select Duration value between 1 to 365 but value is ' + pos1.Duration__c );
                
                
            }
            
            
        }      
        
    }
    
    public static void restrictPoistionWOUTHiringManager(){
        
        	system.debug('restrictPoistionWOUTHiringManager method called');
        	
            for(Position__c pos: (list<Position__c>)Trigger.New){
            
            
            if(pos.workshopday__Hiring_Manager__c == null){
                pos.addError('Every Position must have a Hiring Manager ');
                
                
            }
            
            
            
        }
        
    }
  

}