public class PracticeExercises {
    public static void exampleOne() {
        String name = '10';
        System.debug(name); 
    }
    
    public static void exampleTwo() {
        Integer age = 20;
        System.debug(age * 20);
    }
    
    public static void listOfNames(){
        List<String> Names = new String[]{'Amanda','Joan', 'Kirsten'};
            // loop through names and debug
            for (String name : names){
                System.debug(Name); 
            }
    }
    
    public static void listOfAccounts() {
        List<Account> accList = [SELECT Name, Rating FROM Account WHERE Rating = 'Hot'];
        for(Account a : accList) {
             if (a.rating == 'Hot') {
            System.debug(a.name);
        }
       
            
            
        }
          
        }
}