public class DMLExamples {
    public static void classExample() {
        // Class
        Class__c c = new Class__c();
        c.Name = 'HIS400';
        c.ClassSubject__c = 'History';
        c.ClassTopic__c = 'American History';
        c.Capacity__c = 50;
        c.StartDate__c = Date.newInstance(2019, 7, 30);
        insert c;
        
        // Student
         Student__c s = new Student__c();
        s.Name = 'Matt Ruiz';
        s.Age__c = 18;
        s.Email__c = '123@123.com';
        s.Status__c = 'Enrolled';
        insert c;
        
        // Class Enrollment
        ClassEnrollment__c ce = new ClassEnrollment__c(Class__c=c.Id, Student__c=s.Id);
        insert new ClassEnrollment__c(Class__c=c.Id, Student__c=s.Id);
    }
    // We do NOT want to perform DML operations on individual records.
   
    public static void dontDoThis() {
        Account a = new Account(Name='test1');
        insert a;
        Account a2 = new Account(Name='test2');
        insert a2;
        Account a3 = new Account(Name='test3');
        insert a3;
    }
    // Instead, perform DML on a list of records
    
    public static void doThis() {
        List<Account> accList = new List<Account>();
        
        for (Integer i  = 0; i < 3; i++) {
            accList.add(new Account(Name='t'+i));
        }
        insert accList;
    }
    /*
     * Using the upsert operation, you can either update or insert an existing record in one call.
     * To determine wheater a record already exists, the upsert statment uses that record's ID as 
     * the key to match the records.
     * 
     * - If the key is not matched, then a new record is created.
     * If the key is matched once, then the existing record is updated.
     * If using an external ID, if the key is matched multiple times, then an error is generated
     * 	and the record is neither updated or insterted
     * */
    
    public static void upsertExample() {
        List<Account> accList = [SELECT BillingCity
                                 FROM Account
                                 Where BillingCity='New York'];
        
        for(Account a : accList) {
            a.BillingCity = 'Mumbai';
        }
        
        accList.add(new Account(Name='Acme', BillingCity='San Francisco'));
        
        //Invalid record
        accList.add(new Account(BillingCity='San Francisco'));
        
        upsert accList;
        
    }
    
    /*
     * Deleted records aren't deleated permanently from SF, but they are placed
     * into the Recycle Bin for 15 days where they can be restored.
     * */
    
    public static void deleteExample() {
        insert new Account(Name='Billy\'s Antique Shop');
        Account a = [SELECT Name From Account WHERE Name='Billy\'s Antique Shop'];
        System.debug('a :' + a);
        delete a;
        
       a = [SELECT Name From Account WHERE Name='Billy\'s Antique Shop'];
        System.debug('a: ' + a);
       
                           
    }
     /*
      * SOQL statments can use the ALL ROWS keywords/clause to query all records in an org,
      * included deleted records.
      * */
       
            public static void undeleteExample() {
              system.debug('All Students - Not including delted: ' + [SELECT 
                                                                      Name 
                                                                      FROM 
                                                                      Student__c
                                                                     WHERE
                                                                     	Name='Kelly']);
                
                List<Student__c> students = [SELECT
                                             Name 
                                             FROM 
                                             Student__c 
                                             ALL ROWS];
                System.debug('students: ' + students);
                undelete students;
                           }
    

}