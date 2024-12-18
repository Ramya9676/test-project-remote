@IsTest
public class ZohoDepartmentJSON2Apex_Test {
    static testMethod void testParse() {
		String json = '{'+
		'  \"data\" : [ {'+
		'    \"isDefault\" : true,'+
        '    \"sanitizedName\" : \"AutoRABIT\",'+
        '    \"isVisibleInCustomerPortal\" : true,'+
        '    \"isEnabled\" : true,'+
        '    \"isAssignToTeamEnabled\" : true,'+
        '    \"chatStatus\" : true,'+
        '    \"hasLogo\" : true,'+
        '    \"nameInCustomerPortal\" : \"AutoRABIT\",'+
        '    \"creatorId\" : \"241415000070365001\",'+
        '    \"createdTime\" : \"2022-02-18T04:07:57.000Z\",'+
        '    \"description\" : \"AutoRABIT\",'+
        '    \"name\" : \"AutoRABIT\",'+
		'    \"id\" : \"241415000064902193\"'+
            		'  } ]'+
		'}';
		ZohoDepartmentJSON2Apex obj = ZohoDepartmentJSON2Apex.parse(json);
		System.assert(obj != null);
	}
}