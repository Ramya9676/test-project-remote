@isTest
public class GameManagerTest {
    @isTest
    static void testGetIndoorGames() {
        // Create test data
        Game__c game1 = new Game__c(Name = 'Chess', Indoor_Games__c = 'Indoor');
        Game__c game2 = new Game__c(Name = 'Football', Indoor_Games__c = 'Outdoor');
        insert new List<Game__c>{game1, game2};

        // Call the method
        List<Game__c> indoorGames = GameManager.getIndoorGames();

        // Verify results
        System.assertEquals(1, indoorGames.size());
        System.assertEquals('Chess', indoorGames[0].Name);
    }

    @isTest
    static void testCreateGame() {
        // Call the createGame method
        String name = 'Badminton';
        String gameType = 'Indoor';
        Id gameId = GameManager.createGame(name, gameType);

        // Verify the game was created
        Game__c createdGame = [SELECT Name, Indoor_Games__c FROM Game__c WHERE Id = :gameId];
        System.assertEquals(name, createdGame.Name);
        System.assertEquals(gameType, createdGame.Indoor_Games__c);
    }
}