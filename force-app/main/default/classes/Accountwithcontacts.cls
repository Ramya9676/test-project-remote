public with sharing class Accountwithcontacts {
    @Auraenabled
    public static list<Account> getall(){
        return [Select id,name from Account];
    }



    //Get Contact Records
     @AuraEnabled
    public static String getallcontacts(Integer pageSize, Integer pageNumber, String recid){
        String jsonDT = '';

        //Offset for SOQL
        Integer offset = (pageNumber - 1) * pageSize;

        //Total Records
        Integer totalRecords = [SELECT COUNT() FROM Contact Where AccountId =:recid WITH SECURITY_ENFORCED];
        Integer recordEnd = pageSize * pageNumber;

        ContactDTWrapper contactobj =  new ContactDTWrapper();  
        contactobj.pageSize = pageSize;
        contactobj.pageNumber = pageNumber;
        contactobj.recordStart = offset + 1;
        contactobj.recordEnd = totalRecords >= recordEnd ? recordEnd : totalRecords;
        contactobj.totalRecords = totalRecords;
        contactobj.contacts = [SELECT Id, Name, Phone, Email,AccountId from contact Where Id =:recid Order By Name Asc LIMIT :pageSize OFFSET :offset];
        jsonDT = JSON.serialize(contactobj);
        return jsonDT;
    }

    public class ContactDTWrapper {
        public Integer pageSize {get;set;}
        public Integer pageNumber {get;set;}
        public Integer totalRecords {get;set;}
        public Integer recordStart {get;set;}
        public Integer recordEnd {get;set;}
        public List<contact> contacts {get;set;}
    }

}