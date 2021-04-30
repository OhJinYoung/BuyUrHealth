package Cart.model.vo;

import java.sql.Date;

public class Cart {
	private String cartNo;
	private String productName;
	private int cartVolumn;
	private int productPrice;
	private int cartPrice;
	private Date receiptDate;
	private int userNo;
	private int productNo;
	
	public Cart() {}

	public Cart(String cartNo, String productName, int cartVolumn, int productPrice, int cartPrice, Date receiptDate,
			int userNo, int productNo) {
		super();
		this.cartNo = cartNo;
		this.productName = productName;
		this.cartVolumn = cartVolumn;
		this.productPrice = productPrice;
		this.cartPrice = cartPrice;
		this.receiptDate = receiptDate;
		this.userNo = userNo;
		this.productNo = productNo;
	}

	public String getCartNo() {
		return cartNo;
	}

	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCartVolumn() {
		return cartVolumn;
	}

	public void setCartVolumn(int cartVolumn) {
		this.cartVolumn = cartVolumn;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	public Date getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(Date receiptDate) {
		this.receiptDate = receiptDate;
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
		return "Cart [cartNo=" + cartNo + ", productName=" + productName + ", cartVolumn=" + cartVolumn
				+ ", productPrice=" + productPrice + ", cartPrice=" + cartPrice + ", receiptDate=" + receiptDate
				+ ", userNo=" + userNo + ", productNo=" + productNo + "]";
	}
	
	
}
