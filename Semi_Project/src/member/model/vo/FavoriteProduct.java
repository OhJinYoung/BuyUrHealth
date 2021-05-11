package member.model.vo;

public class FavoriteProduct {
	
	private String productName;
	private int productPrice;
	private int userNo;
	private int productNo;
	
	public FavoriteProduct() {}

	public FavoriteProduct(String productName, int productPrice, int userNo, int productNo) {
		super();
		this.productName = productName;
		this.productPrice = productPrice;
		this.userNo = userNo;
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "FavoriteProduct [productName=" + productName + ", productPrice=" + productPrice + ", userNo=" + userNo
				+ ", productNo=" + productNo + "]";
	}
	
	

}
