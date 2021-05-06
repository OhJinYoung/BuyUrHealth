package product.model.vo;

import java.sql.Date;

public class ProductFile {
	
	private int fileNo;
	private String fileName;
	private int productNo;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private char fileYN;


	public ProductFile() {}


	public ProductFile(int productNo, String changeName) {
		super();
		this.productNo = productNo;
		this.changeName = changeName;
	}


	public ProductFile(int fileNo, String fileName, int productNo, String changeName, String filePath, Date uploadDate,
			char fileYN) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.productNo = productNo;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileYN = fileYN;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	public char getFileYN() {
		return fileYN;
	}


	public void setFileYN(char fileYN) {
		this.fileYN = fileYN;
	}


	@Override
	public String toString() {
		return "ProductFile [fileNo=" + fileNo + ", fileName=" + fileName + ", productNo=" + productNo + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileYN=" + fileYN + "]";
	}


	
	
}