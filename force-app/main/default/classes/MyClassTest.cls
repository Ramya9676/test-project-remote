@isTest
private class MyClassTest {
    @isTest
    static void testAddNumbers() {
        // Test case 1
        Integer result1 = MyClass.addNumbers(2, 3);
        System.assertEquals(5, result1, 'Expected result is 5');

        // Test case 2
        Integer result2 = MyClass.addNumbers(-5, 10);
        System.assertEquals(5, result2, 'Expected result is 5');

        // Test case 3
        Integer result3 = MyClass.addNumbers(0, 0);
        System.assertEquals(0, result3, 'Expected result is 0');
    }
}