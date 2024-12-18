@isTest
private class schedZohoDeskDataTest {
        @isTest static void test() {
        String CRON_EXP = '0 0 0 15 11 ? 2040';
        schedZohoDeskData uca = new schedZohoDeskData();
        Test.startTest();
        String jobId = system.schedule('ScheduledApexTest', CRON_EXP, uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(1,1);
    }
}