public class ClassValidator {
    public static void checkForDuplicateClasses(Class__c classOfInterest) {
        List<Class__c> existingClasses = [SELECT 
                                          Id 
                                          FROM
                                          Class__c
                                          WHERE 
                                          Name =: classOfInterest.Name
                                         ];
        
        if(existingClasses.size() > 0) {
            classofInterest.addError('There already exists a class with this name.');
        }
    }
}