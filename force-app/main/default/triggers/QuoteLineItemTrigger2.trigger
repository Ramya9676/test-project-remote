trigger QuoteLineItemTrigger2 on QuoteLineItem (before insert, after insert, after update) {
    switch on Trigger.operationType { 
            when BEFORE_INSERT {
                QuoteLineItemTriggerHandler.beforeInsert(Trigger.new);
            }
            when BEFORE_UPDATE {
                // QuoteLineItemTriggerHandler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when BEFORE_DELETE {
                // QuoteLineItemTriggerHandler.beforeDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_INSERT {
                QuoteLineItemTriggerHandler.afterInsert(Trigger.new, Trigger.newMap);
            }
            when AFTER_UPDATE {
                QuoteLineItemTriggerHandler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when AFTER_DELETE {
                // QuoteLineItemTriggerHandler.afterDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_UNDELETE {
                // QuoteLineItemTriggerHandler.afterUndelete(Trigger.new, Trigger.newMap);
            }
    }
}