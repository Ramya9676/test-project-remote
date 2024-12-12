public with sharing class CustomLogger {
    public static void logInfo(String message) {
        System.debug(LoggingLevel.INFO, 'INFO: ' + message);
    }

    public static void logError(String message) {
        System.debug(LoggingLevel.ERROR, 'ERROR: ' + message);
    }
}