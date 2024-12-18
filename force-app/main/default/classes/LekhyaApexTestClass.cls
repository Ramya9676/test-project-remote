public class LekhyaApexTestClass {
    @AuraEnabled
    public static List<RelatedFile> getFiles(String recordID){
        Map<Id,RelatedFile> contentDocMap = new Map<Id,RelatedFile>();
        for(avnio__FileExplorerFile__c explorerFile : [select id,avnio__Folder__r.avnio__Label__c,avnio__Label__c,avnio__ContentSize__c, avnio__FileType__c,avnio__ContentDocumentId__c from avnio__FileExplorerFile__c where avnio__LinkedEntityId__c = :recordID]) {
            contentDocMap.put(explorerFile.avnio__ContentDocumentId__c, new RelatedFile(explorerFile.avnio__Folder__r.avnio__Label__c));
        }
        if(contentDocMap.size() == 0) {
            for(ContentDocumentLink documentLink : [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordID]) {
                contentDocMap.put(documentLink.ContentDocumentId, new RelatedFile());
            }
        }
        for(ContentDocument contDocument : [select id,Title,ContentSize, FileType, LatestPublishedVersionId from ContentDocument WHERE Id in :contentDocMap.keySet()]) {
            RelatedFile file = contentDocMap.get(contDocument.Id);
            file.id = contDocument.LatestPublishedVersionId;
            file.ContentSize = contDocument.ContentSize;
            file.FileType = contDocument.FileType;
            file.Title = contDocument.Title;
            contentDocMap.put(contDocument.Id, file);
        }
        return contentDocMap.values();
    }
 
    public class RelatedFile {
        @AuraEnabled public String id {get; set;}
        @AuraEnabled public String Title {get; set;}
        @AuraEnabled public String FileType {get; set;}
        @AuraEnabled public Integer ContentSize {get; set;}
        @AuraEnabled public String FolderName {get; set;}
 
        public RelatedFile() {
        }
 
        public RelatedFile(String folderName) {
            this.FolderName = folderName;
        }
    }
}