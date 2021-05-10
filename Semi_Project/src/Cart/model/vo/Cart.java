package Cart.model.vo;

import java.sql.Date;

public class Cart {
	private int cartNo; // userNo와 같도록
	private String productName;
	private int productVolume; // 재고
	private int cartVolume;
	private int productPrice;
	private int cartPrice;
	private int userNo;
	private int productNo;
	private int orderNo;
	
	public Cart() {}
	
	public Cart(int cartNo, String productName, int productVolume, int cartVolume, int productPrice, int cartPrice,
			int userNo, int productNo, int orderNo) {
		super();
		this.cartNo = cartNo;
		this.productName = productName;
		this.productVolume = productVolume;
		this.cartVolume = cartVolume;
		this.productPrice = productPrice;
		this.cartPrice = cartPrice;
		this.userNo = userNo;
		this.productNo = productNo;
		this.orderNo = orderNo;
	}

	public Cart(int cartNo, String productName, int productVolume, int cartVolume, int productPrice, int cartPrice, int userNo,
			int productNo) {
		super();
		this.cartNo = cartNo;
		this.productName = productName;
		this.productVolume = productVolume;
		this.cartVolume = cartVolume;
		this.productPrice = productPrice;
		this.cartPrice = cartPrice;
		this.userNo = userNo;
		this.productNo = productNo;
	}
	
	public Cart(String productName, int productVolume, int productPrice, int cartPrice, int userNo, int productNo) {
		super();
		this.productName = productName;
		this.productVolume = productVolume;
		this.productPrice = productPrice;
		this.cartPrice = cartPrice;
		this.userNo = userNo;
		this.productNo = productNo;
	}

	public Cart(String productName, int cartVolume, int productPrice, int userNo) {
		super();
		this.productName = productName;
		this.cartVolume = cartVolume;
		this.productPrice = productPrice;
		this.userNo = userNo;
	}
	
	public Cart(int cartVolume, int userNo, int productNo) {
		super();
		this.cartVolume = cartVolume;
		this.userNo = userNo;
		this.productNo = productNo;
	}
	
	public Cart(int cartNo, String productName, int productVolume, int cartVolume, int productPrice, int userNo,
			int productNo) {
		super();
		this.cartNo = cartNo;
		this.productName = productName;
		this.productVolume = productVolume;
		this.cartVolume = cartVolume;
		this.productPrice = productPrice;
		this.userNo = userNo;
		this.productNo = productNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCartVolume() {
		return cartVolume;
	}

	public void setCartVolume(int cartVolume) {
		this.cartVolume = cartVolume;
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
	
	public int getProductVolume() {
		return productVolume;
	}

	public void setProductVolume(int productVolume) {
		this.productVolume = productVolume;
	}
	
	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", productName=" + productName + ", productVolume=" + productVolume
				+ ", cartVolume=" + cartVolume + ", productPrice=" + productPrice + ", cartPrice=" + cartPrice
				+ ", userNo=" + userNo + ", productNo=" + productNo + ", orderNo=" + orderNo + "]";
	}

	

	

	
	
	
}
