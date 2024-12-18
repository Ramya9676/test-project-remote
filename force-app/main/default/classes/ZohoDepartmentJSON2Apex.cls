public class ZohoDepartmentJSON2Apex {

	public class Data {
		public Boolean isDefault;
		public String sanitizedName;
		public Boolean isVisibleInCustomerPortal;
		public Boolean isEnabled;
		public Boolean isAssignToTeamEnabled;
		public String chatStatus;
		public Boolean hasLogo;
		public String nameInCustomerPortal;
		public String creatorId;
		public String createdTime;
		public String description;
		public String name;
		public String id;
	}

	public List<Data> data;

	
	public static ZohoDepartmentJSON2Apex parse(String json) {
		return (ZohoDepartmentJSON2Apex) System.JSON.deserialize(json, ZohoDepartmentJSON2Apex.class);
	}
}