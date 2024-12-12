@isTest
private class CaseEscalationHandlerTest {
    @testSetup
    static void setupTestData() {
        // Create test cases
        Case case1 = new Case(Subject = 'Test Case 1', Priority = 'High', Status = 'New');
        Case case2 = new Case(Subject = 'Test Case 2', Priority = 'Medium', Status = 'In Progress');
        Case case3 = new Case(Subject = 'Test Case 3', Priority = 'High', Status = 'Escalated', IsEscalated = true);
        insert new List<Case>{case1, case2, case3};
    }

    @isTest
    static void testEscalateHighPriorityCases() {
        Test.startTest();
        CaseEscalationHandler.escalateHighPriorityCases();
        Test.stopTest();

        // Verify the results
        List<Case> escalatedCases = [SELECT IsEscalated FROM Case WHERE Priority = 'High' AND Status != 'Closed'];
        for (Case c : escalatedCases) {
            System.assert(c.IsEscalated, 'Case should be escalated');
        }
    }
}