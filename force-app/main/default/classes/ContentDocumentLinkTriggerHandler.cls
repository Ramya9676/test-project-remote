public class ContentDocumentLinkTriggerHandler {
	public static void handle(List<ContentDocumentLink> contDocList){
        Set<Id> contDocId = new Set<Id>();
        Set<Id> cdIdsOrder = new Set<Id>();
        Set<Id> oppId = new set<Id>();
        
        
        for(ContentDocumentLink cdl : contDocList) { 
            if(String.valueof(cdl.LinkedEntityId).startsWith('006')) {
                contDocId.add(cdl.ContentDocumentId);
            }    
        }
        //Now have list of document Ids that might have order titles
        
        if(!contDocId.isEmpty()){
            List<ContentDocument> contDocWithOrderTitle = [Select Id from ContentDocument where Id in :contDocId AND (Title LIKE '%po%' OR Title LIKE '%order%' OR Title LIKE '%signed%' OR Title LIKE '%Docusign%')];
            for(ContentDocument cdo:contDocWithOrderTitle){
                cdIdsOrder.add(cdo.Id);
            }
        }
        //Now have list of ContentDocument Id's that had order in the title
        
        if(!cdIdsOrder.isEmpty()){
            List<ContentDocumentLink> cdlOrderOpp = [Select Id, LinkedEntityId from ContentDocumentLink where ContentDocumentId in :cdIdsOrder];
                for(ContentDocumentLink cdl2 : cdlOrderOpp){
                    If(String.valueof(cdl2.LinkedEntityId).startsWith('006')){
                       oppId.add(cdl2.LinkedEntityId); 
                    }
                }
        }
        //Now have list of opportunities we want to check the has order box on
        
        if(!oppId.isEmpty()){
            List<Opportunity> relatedOpps = [SELECT Id,Order_Attached__c FROM Opportunity
            WHERE Id IN :oppId];
            
            List<Opportunity> oppsToUpdate = new List<Opportunity>();
            // Iterate over the related opportunities
            for(Opportunity opp : relatedOpps) {      
                opp.Order_Attached__c =true;
                    oppsToUpdate.add(opp);
            }
        
            // Perform DML on a collection
            if (oppsToUpdate.size() > 0){
                update oppsToUpdate;
            }
        }        

    }
}