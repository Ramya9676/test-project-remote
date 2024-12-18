trigger UpdateReferenceableContact on Contact   (after insert, after update) {

        List<Id> AccID = New List<Id>();
            for(Contact con : Trigger.new){
              //if (con.Referenceable__c != trigger.oldMap.get(con .Id).Referenceable__c){
                if(con.AccountId != null){
                        AccID.add(con.AccountId);
                }
              //  }
            }

        List<contact> con = [SELECT Id,Referenceable__c FROM Contact WHERE Account.Id != null AND Account.Id In:AccID AND Referenceable__c = true] ;
        system.debug('>>con size'+ con.size() );
        list<Account> acclist = new List<Account>();
        map<id,account> accmap = new map<id,account>();
         if (Trigger.isUpdate){
            for(Contact s : Trigger.new){
            system.debug('>>> new'+ s.Referenceable__c + trigger.oldMap.get(s.Id).Referenceable__c);
            if (s.Referenceable__c != trigger.oldMap.get(s.Id).Referenceable__c){
             Account a = new Account();
           
               
                a.Id = s.AccountId;
                if(s.Referenceable__c == true && con.size()>0){
                        a.Referenceble__c= true;}
                else if(con.size()== 0) {
                        a.Referenceble__c= false;
                    }
               
                acclist.add(a);
                }
            }
            }
            
           else if (Trigger.isinsert){
            for(Contact s : Trigger.new){
           
            
             Account a = new Account();
                a.Id = s.AccountId;
                if(s.Referenceable__c == true && con.size()>0){
                        a.Referenceble__c= true;
                
                acclist.add(a);
                }
                
            }
            } 
            if(acclist.size()>0){
            accmap.putall(acclist);
            if(accmap.size()>0 ){
                    update accmap.values();
               }
               }
    }