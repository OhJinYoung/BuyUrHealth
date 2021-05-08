package product.model.vo;

public class Product {
	private int productNo;
	private String productName;
	private int categoryNo;
	private int productVolume;
	private String productDetail;
	private int productPrice;

	public Product() {
	}

	public Product(int productNo, String productName, int categoryNo, int productVolume, String productDetail,
			int productPrice) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.categoryNo = categoryNo;
		this.productVolume = productVolume;
		this.productDetail = productDetail;
		this.productPrice = productPrice;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getProductVolume() {
		return productVolume;
	}

	public void setProductVolume(int productVolume) {
		this.productVolume = productVolume;
	}

	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", categoryNo=" + categoryNo
				+ ", productVolume=" + productVolume + ", productDetail=" + productDetail + ", productPrice="
				+ productPrice + "]";
	}

	
	
}
