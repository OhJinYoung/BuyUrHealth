package Board.model.vo;

import java.sql.Date;

public class Community {
	private int commNo;
	private String commTitle;
	private String commContent;
	private Date commDate;
	private int userNo;
	private int ctgNo;
	
	public Community() {}

	public Community(int commNo, String commTitle, String commContent, Date commDate, int userNo, int ctgNo) {
		super();
		this.commNo = commNo;
		this.commTitle = commTitle;
		this.commContent = commContent;
		this.commDate = commDate;
		this.userNo = userNo;
		this.ctgNo = ctgNo;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getCommTitle() {
		return commTitle;
	}

	public void setCommTitle(String commTitle) {
		this.commTitle = commTitle;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Date getCommDate() {
		return commDate;
	}

	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCtgNo() {
		return ctgNo;
	}

	public void setCtgNo(int ctgNo) {
		this.ctgNo = ctgNo;
	}

	@Override
	public String toString() {
		return "Community [commNo=" + commNo + ", commTitle=" + commTitle + ", commContent=" + commContent + ", commDate="
				+ commDate + ", userNo=" + userNo + ", ctgNo=" + ctgNo + "]";
	}
	
	

}
