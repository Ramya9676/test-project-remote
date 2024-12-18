public class GameManager {
// Method to retrieve games marked as "Indoor"
    public static List<Game__c> getIndoorGames() {
        return [SELECT Id, Name, Indoor_Games__c FROM Game__c WHERE Indoor_Games__c = 'Indoor'];
    }

    // Method to create a new game record
    public static Id createGame(String name, String gameType) {
        Game__c newGame = new Game__c(
            Name = name,
            Indoor_Games__c = gameType
        );
        insert newGame;
        return newGame.Id;
    }
}