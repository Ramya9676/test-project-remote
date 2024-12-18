public class JunkClass2 {
    public Boolean someBoolean;
    public List<String> someList;

    // Constructor
    public JunkClass2() {
        someBoolean = true;
        someList = new List<String>();
    }

    // Method to set the boolean
    public void setBoolean(Boolean bool) {
        someBoolean = bool;
    }

    // Method to get the boolean
    public Boolean getBoolean() {
        return someBoolean;
    }

    // Method to add a string to the list
    public void addToList(String str) {
        someList.add(str);
    }

    // Method to get the list
    public List<String> getList() {
        return someList;
    }

    // A method that does nothing useful
    public void doNothing() {
        System.debug('This method also does nothing.');
    }
}