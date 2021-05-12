package product.model.vo;

public class Product {
	private int productNo;
	private String productName;
	private int categoryNo;
	private int productVolume;
	private String productDetail;
	private int productPrice;
	private String cateName;
	private String filePath;
	private String fileName;

	public Product() {
	}

	public Product(int productNo, String productName, int productPrice, int productVolume,String cateName, String filePath,
			String fileName) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productVolume = productVolume;
		this.cateName = cateName;
		this.filePath = filePath;
		this.fileName = fileName;
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

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
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
