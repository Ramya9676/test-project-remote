public class ZohoTicketJSON2Apex {
	public List<Data> data;

	public class Data {
		public String webUrl;
		public String contactId;
		public String departmentId;
		public String accountId;
		public String closedTime;
		public String priority;
		public String createdTime;
		public String statusType;
		public String status;
		public String subject;
		public String ticketNumber;
		public String id;
	}

	
	public static ZohoTicketJSON2Apex parse(String json) {
		return (ZohoTicketJSON2Apex) System.JSON.deserialize(json, ZohoTicketJSON2Apex.class);
	}
}