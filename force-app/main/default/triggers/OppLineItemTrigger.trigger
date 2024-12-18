trigger OppLineItemTrigger on OpportunityLineItem (before insert, after insert, after update, after delete) {
    switch on Trigger.operationType { 
            when BEFORE_INSERT {
                OppLineItemTriggerHandler.beforeInsert(Trigger.new);
            }
            when BEFORE_UPDATE {
                //OppLineItemTriggerHandler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when BEFORE_DELETE {
                // OppLineItemTriggerHandler.beforeDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_INSERT {
                OppLineItemTriggerHandler.afterInsert(Trigger.new, Trigger.newMap);
            }
            when AFTER_UPDATE {
                SwitchOffTrigger__c notriggers = SwitchOffTrigger__c.getInstance(UserInfo.getUserId());
                if(notriggers == null || (notriggers!=null && !notriggers.Switch__c)){
                    OppLineItemTriggerHandler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
                }
            }
            when AFTER_DELETE {
                 OppLineItemTriggerHandler.afterDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_UNDELETE {
                // OppLineItemTriggerHandler.afterUndelete(Trigger.new, Trigger.newMap);
            }
    }
}