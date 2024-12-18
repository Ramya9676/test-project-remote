@isTest
public class HiWorldTest {
    @isTest
    static void testGetMessage() {
        HiWorld hello = new HiWorld();
        String message = hello.getMessage();
        System.assertEquals('Hello, World!', message);
    }
}