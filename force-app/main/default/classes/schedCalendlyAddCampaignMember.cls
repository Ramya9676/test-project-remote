public class schedCalendlyAddCampaignMember implements Schedulable {
    public void execute(SchedulableContext ctx) {
        //Find DreamForce2022 campaign Id
        List<Campaign> dreamforce2022 = [SELECT ID FROM CAMPAIGN WHERE NAME='G-GLOB-EVENTS-Dreamforce2022' LIMIT 1];
        String dreamforce2022id = dreamforce2022[0].Id;
        //Find members in Dreamforce2022 Campaign
        List<CampaignMember> Dreamforce2022CampaignMembers = new list<CampaignMember>([SELECT Id, LeadOrContactId FROM CampaignMember WHERE CAMPAIGNID=:dreamforce2022id]);
        Set<Id> dream2022members = new Set<Id>();
        For (CampaignMember d2022 : Dreamforce2022CampaignMembers){
            dream2022members.add(d2022.LeadOrContactId);
        }
        //Find WhoId of Events Where that record should be associated with a campaign
        List<Event> eventWhoIdIntroCalendly = new List<Event>([SELECT Id, WhoId FROM Event WHERE SUBJECT LIKE 'Intro Call%' AND LOCATION LIKE '%calendly%' AND WhoId NOT IN :dream2022members]);
        Set<Id> leadOrContactIntroCalendly = new Set<Id>();
        For (Event ev : eventWhoIdIntroCalendly){
            leadOrContactIntroCalendly.add(ev.WhoId);
        }
        List<CampaignMember> campaignMembersToInsert = new List<CampaignMember>();
        For (Id i : leadOrContactIntroCalendly){
            CampaignMember cm = new CampaignMember();
            cm.CampaignId=dreamforce2022id;
            cm.Status='Connected';
            if(String.valueOf(i).substring(0,3)=='003'){
                cm.ContactId=i;
            }else{
                cm.LeadId=i;
            }
            campaignMembersToInsert.add(cm);
        }
        if(!campaignMembersToInsert.isEmpty()){
            Insert campaignMembersToInsert;
        }
    }
}