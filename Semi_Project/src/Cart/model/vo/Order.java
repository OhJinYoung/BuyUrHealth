package Cart.model.vo;

public class Order {
	private String itemName;
	private int itemNo;
	private int itemNumber;
	private int total;
	private String orderName;
	private String getName;
	private String address;
	private String phone;
	private String email;
	private String forrequest;
	
	public Order() {}

	public Order(String itemName, int itemNo, int itemNumber, int total, String orderName, String getName,
			String address, String phone, String email, String forrequest) {
		super();
		this.itemName = itemName;
		this.itemNo = itemNo;
		this.itemNumber = itemNumber;
		this.total = total;
		this.orderName = orderName;
		this.getName = getName;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.forrequest = forrequest;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getGetName() {
		return getName;
	}

	public void setGetName(String getName) {
		this.getName = getName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getForrequest() {
		return forrequest;
	}

	public void setForrequest(String forrequest) {
		this.forrequest = forrequest;
	}

	@Override
	public String toString() {
		return "Order [itemName=" + itemName + ", itemNo=" + itemNo + ", itemNumber=" + itemNumber + ", total=" + total
				+ ", orderName=" + orderName + ", getName=" + getName + ", address=" + address + ", phone=" + phone
				+ ", email=" + email + ", forrequest=" + forrequest + "]";
	}
	
	
}
