@istest
public class CreateAccTest{
static testmethod void CreateAccTest(){
CreateAcc acc = new CreateAcc();
 Account ac = acc.CreateRecord('name');
}
}