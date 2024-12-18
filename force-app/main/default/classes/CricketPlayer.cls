public class CricketPlayer {

    // Properties of a Cricket Player
    public String playerName;
    public String teamName;
    public Integer runsScored;
    public Integer wicketsTaken;

    // Constructor to initialize a Cricket Player
    public CricketPlayer(String playerName, String teamName) {
        this.playerName = playerName;
        this.teamName = teamName;
        this.runsScored = 0;
        this.wicketsTaken = 0;
    }

    // Method to simulate a player scoring runs
    public void scoreRuns(Integer runs) {
        this.runsScored += runs;
        System.debug(playerName + ' scored ' + runs + ' runs!');
    }

    // Method to simulate a player taking wickets
    public void takeWickets(Integer wickets) {
        this.wicketsTaken += wickets;
        System.debug(playerName + ' took ' + wickets + ' wickets!');
    }

    // Method to display player information
    public void displayPlayerInfo() {
        System.debug('Player Name: ' + playerName);
        System.debug('Team Name: ' + teamName);
        System.debug('Runs Scored: ' + runsScored);
        System.debug('Wickets Taken: ' + wicketsTaken);
    }
}