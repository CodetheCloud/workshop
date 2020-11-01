public class Utility {

    public static integer doAdd(integer num1, integer num2){
        integer res = num1+ num2;
        
        
        return res;
        //return num1+ num2;
        
    }
    
    public static list<Account> getSingleAccount() {
        return [
            SELECT Id, Name, Phone, Type
            FROM Account
            WITH SECURITY_ENFORCED
            LIMIT 2
        ];
		}	


    
    
    public static void sendAccoutDetails(Set<ID> param1){
        list<Account> listAc = [select id, name,(select id, name from contacts) from account where id in: param1];
        
        
     
        
    }
    
}