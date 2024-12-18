public class ZohoAccountJSON2Apex {

	public class Data {
		public String accountName;
		public String id;
	}

	public List<Data> data;

	
	public static ZohoAccountJSON2Apex parse(String json) {
		return (ZohoAccountJSON2Apex) System.JSON.deserialize(json, ZohoAccountJSON2Apex.class);
	}
}