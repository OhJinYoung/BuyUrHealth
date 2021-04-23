package member.model.vo;

public class OrderDetail {
	private int no;
	private int volume;
	private int productNo;
	private int orderNo;

	public OrderDetail() {
	}

	public OrderDetail(int no, int volume, int productNo, int orderNo) {
		super();
		this.no = no;
		this.volume = volume;
		this.productNo = productNo;
		this.orderNo = orderNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

}
