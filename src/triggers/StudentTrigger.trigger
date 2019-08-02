trigger StudentTrigger on Student__c (before insert) {
    
    
    // Trigger Context Variables
    // Trigger.isExecuting() - returns true if the current context for the Apex code is a trigger, not a visualforce page, a web service
    // 		or an executeanonyous() API call
    // 
    // Trigger.isInsert - Returns true if this trigger was fired due to an insert operation.
    // Trigger.isUpdate - Returns true if this trigger was fired dur to an update operation
    // Trigger.isDelete - Returns true if this trigger was fired due to a delete operation
    // Trigger.isUndelete
    // 
    // Trigger.isBefore - Returns true if this trigger was fired before any record was saved
    // Trigger.isAfter - Returns true if this trigger was fired after all records were saved
    // 
    // Trigger.new - Returns a list of the new versions of the sObject records
    // Trigger.old - Returns a list of the old versions of the sObject records
    // 
    // Trigger.newMap - a map of IDs to the new version of the sObject records
    // Trigger.oldMap - A map of IDs to the old versions of the sObject records
    
    if (Trigger.isBefore) {
        if(Trigger.isInsert) {
            StudentValidator.validatePhoneNumber(Trigger.new);
            
        } else if (Trigger.isUpdate) {
            
        }
        
            }
    
    
}