package order.model.vo;

public class Order {
	private int no;
	private String name; // 받는사람 이름
	private String address;
	private String phone;
	private String request;
	private String payment;
	private String state;
	private String orderDate;
	private int userNo; // userNo 추가
	private String userName; // 구매한 회원 이름
	private String userId;
	private String pList; // 구매 상품 목록
	private int price;
	private String trackingNo; // 운송장번호
	private String email;

	public Order() {
	}
	
	// userNo 추가한 생성자 + 주문완료 페이지용 생성자 추가했습니다.
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


	public Order(int no, String name, String address, String phone, String request, String payment, String state,
			String orderDate, String userName, String userId, String trackingNo, String email) {
		super();
		this.no = no;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.request = request;
		this.payment = payment;
		this.state = state;
		this.orderDate = orderDate;
		this.userName = userName;
		this.userId = userId;
		this.trackingNo = trackingNo;
		this.email = email;
	}

	public Order(int no, String state, String orderDate, String userName, String userId, String pList, int price, String trackingNo) {
		super();
		this.no = no;
		this.state = state;
		this.orderDate = orderDate;
		this.userName = userName;
		this.userId = userId;
		this.pList = pList;
		this.price = price;
		this.trackingNo = trackingNo;
	}

	public Order(int no, String name, String address, String phone, String request, String payment, String state,
			String orderDate, String userName, String userId, String pList, int price) {
		super();
		this.no = no;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.request = request;
		this.payment = payment;
		this.state = state;
		this.orderDate = orderDate;
		this.userName = userName;
		this.userId = userId;
		this.pList = pList;
		this.price = price;
	}

	public Order(int no, String name, String address, String phone, String request, String payment, String state,
			String orderDate, String trackingNo, String userName, String userId, String pList, int price,
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
		this.trackingNo = trackingNo;
		this.userName = userName;
		this.userId = userId;
		this.pList = pList;
		this.price = price;
		this.email = email;
	}
	
	public Order(String name, String address, String phone, String payment, String userName, String email) {
		super();
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.payment = payment;
		this.userName = userName;
		this.email = email;
	}

	public Order(int no, String name, String address, String phone, String request, String payment, String state,
			String orderDate, int userNo, String trackingNo, String email) {
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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	

}