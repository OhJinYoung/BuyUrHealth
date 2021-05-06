package Cart.model.vo;

public class Order {
	private int orderNo;
	private String name; // 받는사람 이름
	private String address;
	private String phone;
	private String request;
	private String email;
	private String payment;
	private String state;
	private String orderDate;
	private int userNo;
	private String pList; // 구매 상품 목록
	private int price;
	
	public Order() {}

	public Order(int orderNo, String name, String address, String phone, String request, String email, String payment,
			String state, String orderDate, int userNo, String pList, int price) {
		super();
		this.orderNo = orderNo;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.request = request;
		this.email = email;
		this.payment = payment;
		this.state = state;
		this.orderDate = orderDate;
		this.userNo = userNo;
		this.pList = pList;
		this.price = price;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getpList() {
		return pList;
	}

	public void setpList(String pList) {
		this.pList = pList;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", name=" + name + ", address=" + address + ", phone=" + phone
				+ ", request=" + request + ", email=" + email + ", payment=" + payment + ", state=" + state
				+ ", orderDate=" + orderDate + ", userNo=" + userNo + ", pList=" + pList + ", price=" + price + "]";
	}
	
	
	
}
