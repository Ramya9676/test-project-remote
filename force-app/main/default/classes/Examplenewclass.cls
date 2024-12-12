public class Examplenewclass {
    
    public Integer addNumbers(Integer a, Integer b) {
        return a + b;
    }
    
    public String concatenateStrings(String s1, String s2) {
        return s1 + s2;
    }
    
    public List<Integer> sortNumbers(List<Integer> numbers) {
        numbers.sort();
        return numbers;
    }
   
    public void printHelloWorld() {
        System.debug('Hello World!');
    }
  
    //This is the new Example Class added
    
    //new example class has been added in the org 2
    public List<String> removeDuplicates(List<String> strings) {
        Set<String> setStrings = new Set<String>(strings);
        return new List<String>(setStrings);
    }
    
}