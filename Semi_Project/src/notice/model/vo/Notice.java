package notice.model.vo;

import java.sql.Date;

public class Notice {
	private	int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private String noticeWrtier;
	private int noticeCategory;
	
	public Notice() {}
	
	public Notice(String noticeTitle, String noticeContent, Date noticeDate, String noticeWrtier) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeWrtier = noticeWrtier;
	}


	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, String noticeWrtier) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeWrtier = noticeWrtier;
	}


	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, String noticeWrtier,
			int noticeCategory) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeWrtier = noticeWrtier;
		this.noticeCategory = noticeCategory;
	}






	public int getNoticeNo() {
		return noticeNo;
	}






	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}






	public String getNoticeTitle() {
		return noticeTitle;
	}






	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}






	public String getNoticeContent() {
		return noticeContent;
	}






	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}






	public Date getNoticeDate() {
		return noticeDate;
	}






	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}






	public String getNoticeWrtier() {
		return noticeWrtier;
	}






	public void setNoticeWrtier(String noticeWrtier) {
		this.noticeWrtier = noticeWrtier;
	}






	public int getNoticeCategory() {
		return noticeCategory;
	}






	public void setNoticeCategory(int noticeCategory) {
		this.noticeCategory = noticeCategory;
	}






	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", noticeWrtier=" + noticeWrtier + ", noticeCategory=" + noticeCategory
				+ "]";
	}

	
	




                         
}
