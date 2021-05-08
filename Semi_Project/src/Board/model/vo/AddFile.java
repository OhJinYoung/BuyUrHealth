package Board.model.vo;

import java.sql.Date;

public class AddFile {
	private int fNo;
	private String fName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private char fYN;
	private int commNo;
	private int productNo;
	
	public AddFile() {}
	
	public AddFile(int commNo, String changeName) {
		super();
		this.commNo = commNo;
		this.changeName = changeName;
	}	

	public AddFile(int fNo, String fName, String changeName, String filePath, Date uploadDate, char fYN, int commNo,
			int productNo) {
		super();
		this.fNo = fNo;
		this.fName = fName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fYN = fYN;
		this.commNo = commNo;
		this.productNo = productNo;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
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

	public char getfYN() {
		return fYN;
	}

	public void setfYN(char fYN) {
		this.fYN = fYN;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "AddFile [fNo=" + fNo + ", fName=" + fName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", uploadDate=" + uploadDate + ", fYN=" + fYN + ", commNo=" + commNo + ", productNo=" + productNo
				+ "]";
	}
	
}
