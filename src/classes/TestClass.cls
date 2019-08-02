// To mark a class as a test class, provide the @isTest annotation
@isTest
public class TestClass {
    
   /* @testSetup
    static void setup(){
       TestDataFactory.createTestAccounts(50);
        
        
    }
	@isTest
    static void testAddTwoNumbers() {
        Integer expected = 11;
        Integer actual = MethodsToTest.addTwoNumbers(5, 6);
        System.assertEquals(expected, actual, 'Math is a lie');
        
    }
    @isTest
    static void testUpdateAccountSizeFromNumberOfEmployees() {
    
        
        
        // Call method to test
        AccountMethods.updateAccountSizeFromNumberOfEmployees();
        
        // Testing Single
        
        // Retrieve test data
        Account a1 = [SELECT Size__c FROM Account WHERE Name ='test1' LIMIT 1];
        System.assertEquals('Small', a1.Size__c, 'This account should have a size of small');
        
        Account a2 = [SELECT Size__c FROM Account WHERE Name ='test2' LIMIT 1];
        System.assertEquals('Medium', a2.Size__c, 'This account should have a size of medium');
        
        Account a3 = [SELECT Size__c FROM Account WHERE Name ='test3' LIMIT 1];
        System.assertEquals('Large', a3.Size__c, 'This account should have a size of large');
        
        // Test Bulk Action
        List<Account> accs = [SELECT NumberOfEmployees, Size__c FROM Account WHERE Name LIKE 'Test%'];
        for(Account a : accs) {
            if(a.NumberOfEmployees < 1000) {
                System.assertEquals('Small', a.Size__c, 'This account should have a size of small');
            } else if (a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000) {
               System.assertEquals('Medium', a.Size__c, 'This account should have a size of medium');
            } else {
                System.assertEquals('Large', a.Size__c, 'This account should have a size of large');
            }
            
        }
        
    }
    
    @isTest
    static void testUpdateAccountSizeFromNumberOfLocations() {
        
         List<Account> accs = [SELECT NumberOfLocations__c, Size__c FROM Account WHERE Name LIKE 'Test%'];
        for(Account a : accs) {
            if(a.NumberOfLocations__c < 3) {
                System.assertEquals('Small', a.Size__c, 'This account should have a size of small');
            } else if (a.NumberOfLocations__c  > 3 && a.NumberOfLocations__c < 6) {
               System.assertEquals('Medium', a.Size__c, 'This account should have a size of medium');
            } else {
                System.assertEquals('Large', a.Size__c, 'This account should have a size of large');
            }
            
                     
            
                
            }
        
    }
 */   

        
    
    @isTest 
	static void testRunAs(){
        User u = [SELECT Id From User WHERE Id = '0053i000000vQ56AAE'];
            List<Class__c> classes = [SELECT Id FROM Class__c];
        System.debug('Number of classes seen in System Context: ' + classes.size());
        
        System.runAs(u) {
            classes = [SELECT Id FROM Class__c];
            System.debug('Number of classes seen as Sarah James: ' + classes.size());
        }
    }
}