public class CheckSOSL {

    public static void doCheckSOSL(){
        
        
         List< List<sObject> >   myRes = [FIND 'Tilak OR Inc' IN ALL FIELDS RETURNING Account(Name), Contact(FirstName, LastName), Opportunity(name) ];
      
        system.debug('MY Origial List = '+ myRes);
        /* 08:22:44:030 USER_DEBUG [9]|DEBUG|MY Origial List = (  (  ), (   ), (  )  )
      
        
         08:33:49:110 USER_DEBUG [8]|DEBUG|MY Origial List = 
         (
         (Account:{Name=Tilak, Id=0014W000024eOa6QAE}, Account:{Name=Pyramid Construction Inc. 1, Id=0014W000025aVeRQAU}), 
         (Contact:{FirstName=Tilak, LastName=Raj, Id=0034W00002DvBAsQAN}, Contact:{FirstName=Pat, LastName=Stumuller, Id=0034W00002E0kPAQAZ}), 
         (Opportunity:{Name=India-BuyCar, Id=0064W00000tZSdmQAG}, Opportunity:{Name=Pyramid Emergency Generators, Id=0064W00000vcIAMQA2})
         )
        
        */
        list<Account> listAC = (list<Account> ) myRes[0];
        list<Contact> listCon = (list<Contact> ) myRes[1];
        list<Opportunity> listOpp =(list<Opportunity>) myRes[2];
        
        system.debug('1st list = '+ listAC);
        system.debug('2st list = '+ listCon);
        system.debug('3rd list = '+ listOpp);
        
        
        
    }
}