//*** Trigger to update Lead & Contact Outreact fields when Task is created **//
trigger UpdateLeadsContactswithOutreachTask on Task (after insert) {

    // set up lists you will need
    List<Lead> LeadsToUpdate = new List<Lead>();
    List<Contact> ContactsToUpdate  = new List<Contact>();
    Map<Id, Task> taskMap = new Map<Id, Task>();
 

    // go through the list of tasks that were inserted
    for (Task t: Trigger.New)
    {
      // if they are related to a Lead, add the Lead id (whoID) and their values to a map
      if (t.whoID  != null)
        {
            taskMap.put(t.whoID, t);
        }
    
    // if the map isnt empty
    if (taskMap.size() > 0 && t.Subject.startswith('[Outreach]'))
    {
        // get all of the Leads related to the tasks
        LeadsToUpdate = [SELECT Id,First_Email_Attempt__c,Last_Email_Attempt__c,No_of_Email_Attempts__c,First_Call_Attempt__c,Last_Call_Attempt__c,No_of_Call_Attempts__c FROM Lead WHERE Id IN: taskMap.keySet()];
    }
       // go through the list for each Lead
        for (Lead l: LeadsToUpdate) { 
        if(t.Type == 'Email'){
        if (l.First_Email_Attempt__c ==null && l.Last_Email_Attempt__c ==null){
           l.First_Email_Attempt__c = t.CreatedDate;
           l.Last_Email_Attempt__c = t.CreatedDate;
            l.No_of_Email_Attempts__c = 1;
        }
        else {
            l.Last_Email_Attempt__c = t.CreatedDate;
            l.No_of_Email_Attempts__c = l.No_of_Email_Attempts__c + 1;
        }
        }
        if(t.Type == 'Call'){
            if (l.First_Call_Attempt__c ==null && l.Last_Call_Attempt__c ==null){
                    l.First_Call_Attempt__c = t.CreatedDate;
                    l.Last_Call_Attempt__c = t.CreatedDate;
                    l.No_of_Call_Attempts__c = 1;
        }
        else {
                        l.Last_Call_Attempt__c = t.CreatedDate;
                        l.No_of_Call_Attempts__c = l.No_of_Call_Attempts__c + 1;
        }
        
        }
        

        // if the list of Leads isnt empty, update them
        if (LeadsToUpdate.size() > 0)
        {
            update LeadsToUpdate;
        }
       } 
       
       // For Contact
       
        if (taskMap.size() > 0 && t.Subject.startswith('[Outreach]'))
    {
        // get all of the Leads related to the tasks
       ContactsToUpdate = [SELECT Id,First_Email_Attempt__c,Last_Email_Attempt__c,No_of_Email_Attempts__c,First_Call_Attempt__c,Last_Call_Attempt__c,No_of_Call_Attempts__c FROM Contact WHERE Id IN: taskMap.keySet()];
    }
       // go through the list for each Lead
        for (Contact l: ContactsToUpdate ) { 
        if(t.Type == 'Email'){
        if (l.First_Email_Attempt__c ==null && l.Last_Email_Attempt__c ==null){
           l.First_Email_Attempt__c = t.CreatedDate;
           l.Last_Email_Attempt__c = t.CreatedDate;
            l.No_of_Email_Attempts__c = 1;
        }
        else {
            l.Last_Email_Attempt__c = t.CreatedDate;
            l.No_of_Email_Attempts__c = l.No_of_Email_Attempts__c + 1;
        }
        }
        if(t.Type == 'Call'){
            if (l.First_Call_Attempt__c ==null && l.Last_Call_Attempt__c ==null){
                    l.First_Call_Attempt__c = t.CreatedDate;
                    l.Last_Call_Attempt__c = t.CreatedDate;
                    l.No_of_Call_Attempts__c = 1;
        }
        else {
                        l.Last_Call_Attempt__c = t.CreatedDate;
                        l.No_of_Call_Attempts__c = l.No_of_Call_Attempts__c + 1;
        }
        
        }
        

        // if the list of Leads isnt empty, update them
        if (ContactsToUpdate .size() > 0)
        {
            update ContactsToUpdate ;
        }
       } 
    }
    }