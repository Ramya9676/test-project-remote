@isTest
private class UpdateReferenceableContactTest {
    static testMethod void TestMethod1(){
        
        Account a = new Account(name='test acc',phone='9499999912');
        insert a;
        system.debug('>>>'+a);
        Account a2 = new Account(name='test acc 2',phone='9499999913');
        insert a2;
        Contact con = new Contact(accountid=a.id,lastname='test con',email='abc@gmail.com',Referenceable__c=true );
       // insert con;
        Contact con2 = new Contact(accountid=a.id,lastname='test con2',email='abcd@gmail.com',Referenceable__c=true );
        insert con2;
        Test.startTest();
        try{
            con2.Referenceable__c=false; 
            update con2;
        }
        catch(Exception e){
           system.debug('Duplicate Account Id');
        }
        Test.stopTest();
        }   
        }