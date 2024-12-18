trigger OpportunityTrigger on Opportunity (before insert, before update, after update) {
        switch on Trigger.operationType { 
            when BEFORE_INSERT {
                //OpportunityTriggerHandler.beforeInsert(Trigger.new);
            }
            when BEFORE_UPDATE {
                //OpportunityTriggerHandler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
                SwitchOffTrigger__c notriggers = SwitchOffTrigger__c.getInstance(UserInfo.getUserId());
                if(notriggers == null || (notriggers!=null && !notriggers.Switch__c)){
                    OpportunityTriggerHandlerV2.checkContactRoles(Trigger.new);
                }
            }
            when BEFORE_DELETE {
                // OpportunityTriggerHandler.beforeDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_INSERT {
                //OpportunityTriggerHandler.afterInsert(Trigger.new, Trigger.newMap);
            }
            when AFTER_UPDATE {
                OpportunityTriggerHandler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            //when AFTER_DELETE {
                // OpportunityTriggerHandler.afterDelete(Trigger.old, Trigger.oldMap);
            //}
            //when AFTER_UNDELETE {
                // OpportunityTriggerHandler.afterUndelete(Trigger.new, Trigger.newMap);
            //}
    }
    
    
    //if(!checkRecursive.firstcall) {
       // checkRecursive.firstcall = true;
        //OpportunityTriggerHandler.handle(Trigger.New, Trigger.OldMap);
    //}
}