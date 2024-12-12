@isTest
private class CustomLoggerTest {
    @isTest
    static void testLogInfo() {
        Test.startTest();
        CustomLogger.logInfo('This is an info log');
        Test.stopTest();
        // Use the Debug logs to verify log output manually.
    }

    @isTest
    static void testLogError() {
        Test.startTest();
        CustomLogger.logError('This is an error log');
        Test.stopTest();
        // Verify output through Salesforce Debug Logs.
    }
}