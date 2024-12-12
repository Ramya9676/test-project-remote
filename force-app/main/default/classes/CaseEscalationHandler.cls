public with sharing class CaseEscalationHandler {
    // Method to escalate cases with high priority
    public static void escalateHighPriorityCases() {
        List<Case> casesToEscalate = [SELECT Id, Status, Priority, IsEscalated FROM Case WHERE Priority = 'High' AND Status != 'Closed' AND IsEscalated = false];

        for (Case c : casesToEscalate) {
            c.IsEscalated = true;
        }

        if (!casesToEscalate.isEmpty()) {
            update casesToEscalate;
        }
    }
}