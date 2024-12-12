public class OpportunityTriggerHandlerV2 {
    
    /*** Opportunities should have atleast one Contact Role when Opportunity is created or updated. ***/   
    
    public static void checkContactRoles(List<Opportunity> newOpportunitys) {
    for (Opportunity oppRecord : newOpportunitys) {
        // Contact Role should not be null. 
         for (List<OpportunityContactRole> oppcontrole :[select ContactId from OpportunityContactRole where OpportunityId = :oppRecord.Id ])                                                        
              {
                if (oppcontrole.Size() <= 0)
               {
                  oppRecord.addError('1. Process has changed for creating new opportiunity. Please go the Contact record and create new opportunity from the \'Opportunity\' Related List on the Contact record. 2. Contact Roles cannot be null for an existing opportunity. Please add Contacts from the \'Contact Role\' Related List on the Opportunity record.');
                }
         } 
        
        /*** Opportunity updated as 'Closed-won' - Business Contact, Technical Contact, and First Contact Roles are required. ***/
        if (oppRecord.isWon) {  
               // Check for Business Contact Role
               for (List<OpportunityContactRole> oppcontrole :[select ContactId from OpportunityContactRole where OpportunityId = :oppRecord.Id AND role = 'Business Contact'])                                                        
               {
                if (oppcontrole.Size() < 1)
                {
                  oppRecord.addError('You cannot close an Opportunity without having the Business Contact. Please add \'Business Contact\' in the Contact Roles Related List of the Opportunity.');
                }
                }
                // Check for Technical Contact Role
                for (List<OpportunityContactRole> oppcontrole :[select ContactId from OpportunityContactRole where OpportunityId = :oppRecord.Id AND role = 'Technical Contact'])                                                        
                {
                if (oppcontrole.Size() < 1)
                {
                  oppRecord.addError('You cannot close an Opportunity without having the Technical Contact. Please add \'Technical Contact\' in Contact Roles Related list of the Opportunity.');
                }
                }
               // Check for First Contact Role
               for (List<OpportunityContactRole> oppcontrole :[select ContactId from OpportunityContactRole where OpportunityId = :oppRecord.Id AND role = 'First Contact'])                                                        
               {
                if (oppcontrole.Size() < 1)
                {
                  oppRecord.addError('You cannot close an Opportunity without having the First Contact. Please add \'First Contact\' in Contact Roles Related list of the Opportunity.');
                }
                } 
        } // End of 'iswon', 'if' condition         
    } //End of checkContactRoles Method first 'for' loop
    } //End of checkContactRoles Method
    
} //End of Class