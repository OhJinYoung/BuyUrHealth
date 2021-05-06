package Cart.model.vo;

public class Order {
	private int no;
	private String name; // 받는사람 이름
	private String address;
	private String phone;
	private String request;
	private String payment;
	private String state;
	private String orderDate;
	private int userNo;
	private String userName; // 구매한 회원 이름
	private String userId;
	private String pList; // 구매 상품 목록
	private int price;
	private String trackingNo; // 운송장번호
	private String email;

	public Order() {
	}

	public Order(int no, String name, String address, String phone, String request, String payment, String state,
			String orderDate, int userNo, String userName, String userId, String pList, int price, String trackingNo,
			String email) {
		super();
		this.no = no;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.request = request;
		this.payment = payment;
		this.state = state;
		this.orderDate = orderDate;
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.pList = pList;
		this.price = price;
		this.trackingNo = trackingNo;
		this.email = email;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getTrackingNo() {
		return trackingNo;
	}

	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Order [no=" + no + ", name=" + name + ", address=" + address + ", phone=" + phone + ", request="
				+ request + ", payment=" + payment + ", state=" + state + ", orderDate=" + orderDate + ", userNo="
				+ userNo + ", userName=" + userName + ", userId=" + userId + ", pList=" + pList + ", price=" + price
				+ ", trackingNo=" + trackingNo + ", email=" + email + "]";
	}

	
}