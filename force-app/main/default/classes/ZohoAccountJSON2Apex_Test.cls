@IsTest
public class ZohoAccountJSON2Apex_Test {
    static testMethod void testParse() {
		String json = '{'+
		'  \"data\" : [ {'+
		'    \"accountName\" : \"AutoRABIT\",'+
		'    \"id\" : \"241415000064902193\"'+
            		'  } ]'+
		'}';
		ZohoAccountJSON2Apex obj = ZohoAccountJSON2Apex.parse(json);
		System.assert(obj != null);
	}
}