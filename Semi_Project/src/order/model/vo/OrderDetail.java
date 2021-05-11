package order.model.vo;

public class OrderDetail {
	private int no;
	private int volume;
	private int productNo;
	private int orderNo;
	private String productName;
	private int price;
	private String filePath;
	private String fileName;

	public OrderDetail() {
	}

	public OrderDetail(int no, int volume, String productName, int price, String filePath, String fileName) {
		super();
		this.no = no;
		this.volume = volume;
		this.productName = productName;
		this.price = price;
		this.filePath = filePath;
		this.fileName = fileName;
	}

	public OrderDetail(int no, int volume, int productNo, int orderNo) {
		super();
		this.no = no;
		this.volume = volume;
		this.productNo = productNo;
		this.orderNo = orderNo;
	}

	public OrderDetail(int no, int volume, int productNo, int orderNo, String productName, int price) {
		super();
		this.no = no;
		this.volume = volume;
		this.productNo = productNo;
		this.orderNo = orderNo;
		this.productName = productName;
		this.price = price;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
