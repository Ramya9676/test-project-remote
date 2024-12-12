public class SampleClass {
    
    public void calculateSum(Integer num1, Integer num2) {
        Integer sum = num1 + num2;
        System.debug('The sum is: ' + sum);
    }
    
    public Integer multiplyNumbers(Integer num1, Integer num2) {
        Integer product = num1 * num2;
        return product;
    }
    
    public List<String> getNames(List<Contact> contacts) {
        List<String> names = new List<String>();
        for (Contact contact : contacts) {
            names.add(contact.FirstName + ' ' + contact.LastName);
        }
        return names;
    }
}