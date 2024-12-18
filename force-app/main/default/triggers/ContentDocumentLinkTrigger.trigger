trigger ContentDocumentLinkTrigger on ContentDocumentLink (after insert) {
    ContentDocumentLinkTriggerHandler.handle(Trigger.New);
}