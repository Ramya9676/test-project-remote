/* Test class for the Tasktrigger UpdateLeadsContactswithOutreachTask*/

@isTest
private class TestUpdateLeadswithTask {
    @isTest
    static void testMethodOne() {
        Account acc = new Account();
        acc.Name='Test Account' ;
        insert acc;
        
        Lead lead=new Lead(LastName='Doe',FirstName='John',Company='Test',Status='Inquiry' );

insert lead;

        List<task> t = new List<task>{ new task(
        whoID= lead.id,
        Subject='[Outreach]',
        Status='New',
        Priority='Normal',
        Type= 'Email'
        )};

        insert t;  
     
              
    }
    
   
    @isTest
    static void testMethodLeadCall() {
        Account acc = new Account();
        acc.Name='Test Account' ;
        insert acc;
        
        Lead lead=new Lead(LastName='Doe',FirstName='John',Company='Test',Status='Inquiry' );

insert lead;

        List<task> t = new List<task>{ new task(
        whoID= lead.id,
        Subject='[Outreach]',
        Status='New',
        Priority='Normal',
        Type= 'Call'
        )};

        insert t;  
     
        
        
    }
    
    @isTest
    static void testMethodcontactCall() {
        Account acc = new Account();
        acc.Name='Test Account' ;
        insert acc;
        
          Account a = new Account(name='test acc',phone='9499999912');
        insert a;
        
        Contact con = new Contact(accountid=a.id,lastname='test con',email='abc@gmail.com',Referenceable__c=true );
       
        insert con;

        List<task> t = new List<task>{ new task(
        whoID= con.id,
        Subject='[Outreach]',
        Status='New',
        Priority='Normal',
        Type= 'Call'
        )};

        insert t;  
     
        
        
    }
     @isTest
    static void testMethodcontactemail() {
        Account acc = new Account();
        acc.Name='Test Account' ;
        insert acc;
        
          Account a = new Account(name='test acc',phone='9499999912');
        insert a;
        
        Contact con = new Contact(accountid=a.id,lastname='test con',email='abc@gmail.com',Referenceable__c=true );
       
        insert con;

        List<task> t = new List<task>{ new task(
        whoID= con.id,
        Subject='[Outreach]',
        Status='New',
        Priority='Normal',
        Type= 'Email'
        )};

        insert t;  
     
        
        
    }
}