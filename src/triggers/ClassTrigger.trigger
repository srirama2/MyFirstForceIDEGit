trigger ClassTrigger on Class__c (before update) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            ClassValidator.checkForDuplicateClasses(Trigger.new[0]);
        } else if(Trigger.isUpdate) {
            ClassValidator.checkForDuplicateClasses(Trigger.new[0]);
        }
    }
}