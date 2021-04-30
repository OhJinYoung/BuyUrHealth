package QABoard.model.vo;

import java.sql.Date;

public class QAFile {
	private int fileNo;
	private String fileName;
	private String fileChangeName;
	private String filePath;
	private Date uploadDate;
	private int qaNo;
	
	public QAFile() {}

	public QAFile(int fileNo, String fileName, String fileChangeName, String filePath, Date uploadDate, int qaNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.qaNo = qaNo;
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

	public String getFileChangeName() {
		return fileChangeName;
	}

	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
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

	public int getQaNo() {
		return qaNo;
	}

	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}

	@Override
	public String toString() {
		return "QAFile [fileNo=" + fileNo + ", fileName=" + fileName + ", fileChangeName=" + fileChangeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", qaNo=" + qaNo + "]";
	}

	
}
