package order.model.vo;

public class RequestOrder {
	private int no;
	private String type; // '반품요청', '환불요청', '교환요청'
	private String info; // 사유
	private String date; // 요청일
	private String disposeDate; // 요청처리일
	private int orderNo;
	private String payment;
	private int price;
	private String state;

	public RequestOrder() {
	}

	public RequestOrder(int no, String type, String info, String date, String disposeDate, int orderNo) {
		super();
		this.no = no;
		this.type = type;
		this.info = info;
		this.date = date;
		this.disposeDate = disposeDate;
		this.orderNo = orderNo;
	}

	public RequestOrder(int no, String type, String info, String date, String disposeDate, int orderNo, String payment,
			int price, String state) {
		super();
		this.no = no;
		this.type = type;
		this.info = info;
		this.date = date;
		this.disposeDate = disposeDate;
		this.orderNo = orderNo;
		this.payment = payment;
		this.price = price;
		this.state = state;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDisposeDate() {
		return disposeDate;
	}

	public void setDisposeDate(String disposeDate) {
		this.disposeDate = disposeDate;
	}

}
