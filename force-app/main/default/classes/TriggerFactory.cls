/**
 * Class TriggerFactory
 *
 * Used to instantiate and execute Trigger Handlers associated with sObjects.
 */
public class TriggerFactory
{
    /**
     * Public static method to create and execute a trigger handler
     *
     * Arguments:   Schema.sObjectType soType - Object type to process (SObject.sObjectType)
     *
     * Throws a TriggerException if no handler has been coded.
     */
    public static void createHandler(Schema.sObjectType soType)
    {
        // Get a handler appropriate to the object being processed
        ITrigger handler = getHandler(soType);
         
        // Make sure we have a handler registered, new handlers must be registered in the getHandler method.
        if (handler == null)
        {
            //throw new LeaseWareException('No Trigger Handler registered for Object Type: ' + soType);
        }
         
        // Execute the handler to fulfil the trigger
        execute(handler);
    }
     
    /**
     * private static method to control the execution of the handler
     *
     * Arguments:   ITrigger handler - A Trigger Handler to execute
     */
    private static void execute(ITrigger handler)
    {
        // Before Trigger
        if (Trigger.isBefore)
        {
            // Call the bulk before to handle any caching of data and enable bulkification
            handler.bulkBefore();
             
            // Iterate through the records to be deleted passing them to the handler.
            if (Trigger.isDelete)
            {
                    handler.beforeDelete();
            }
            // Iterate through the records to be inserted passing them to the handler.
            else if (Trigger.isInsert)
            {
                    handler.beforeInsert();
            }
            // Iterate through the records to be updated passing them to the handler.
            else if (Trigger.isUpdate)
            {

                    handler.beforeUpdate();
            }
        }
        else
        {
            // Call the bulk after to handle any caching of data and enable bulkification
            handler.bulkAfter();
             
            // Iterate through the records deleted passing them to the handler.
            if (Trigger.isDelete)
            {
                    handler.afterDelete();
            }
            // Iterate through the records inserted passing them to the handler.
            else if (Trigger.isInsert)
            {
                    handler.afterInsert();
            }
            // Iterate through the records updated passing them to the handler.
            else if (Trigger.isUpdate)
            {
                    handler.afterUpdate();
            }
			else if (Trigger.isUnDelete )
            {
                    handler.afterUnDelete();
            }            
        }
         
        // Perform any post processing
        handler.andFinally();
    }
     
    /**
     * private static method to get the appropriate handler for the object type.
     * Modify this method to add any additional handlers.
     *
     * Arguments:   Schema.sObjectType soType - Object type tolocate (SObject.sObjectType)
     *
     * Returns:     ITrigger - A trigger handler if one exists or null.
     */
    private static ITrigger getHandler(Schema.sObjectType soType)
    {
        if (soType == Account.sObjectType) {
            return new AccountTriggerHandler();  
        }
        
        if (soType == Position__c.sObjectType) {
            
            return new PoistionTriggerHandler(); 
            
        }
        
        if (soType == Contact.sObjectType) {
            
            return new ContactTriggerHandler(); 
            
        }
        
        
        
        return null;
    }
}