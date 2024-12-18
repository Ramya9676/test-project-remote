Public class DemoClass{

public void updateDemo(DemoObject__c demo, String value) {
        demo.Country__c = 'India';
        demo.state__c= 'TS';
        update(demo);
    } }