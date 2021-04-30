package QABoard.model.vo;

import java.sql.Date;

public class QABoard {
	private int qaNo;
	private String qaTitle;
	private String qaContent;
	private Date qaQuestionDate;
	private String qaAnswer;
	private Date qaAnswerDate;
	private int userNo;
	private String userName;
	private int qacateNo;
	private String qacateName;
	private String status;
	
	public QABoard() {}

	public QABoard(int qaNo, String qaTitle, String qaContent, Date qaQuestionDate, String qaAnswer, Date qaAnswerDate,
			int userNo, String userName, int qacateNo, String qacateName, String status) {
		super();
		this.qaNo = qaNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaQuestionDate = qaQuestionDate;
		this.qaAnswer = qaAnswer;
		this.qaAnswerDate = qaAnswerDate;
		this.userNo = userNo;
		this.userName = userName;
		this.qacateNo = qacateNo;
		this.qacateName = qacateName;
		this.status = status;
	}
	
	

	public QABoard(int qaNo, String qaTitle, String qaContent, Date qaQuestionDate, String qacateName) {
		super();
		this.qaNo = qaNo;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaQuestionDate = qaQuestionDate;
		this.qacateName = qacateName;
	}

	public int getQaNo() {
		return qaNo;
	}

	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public Date getQaQuestionDate() {
		return qaQuestionDate;
	}

	public void setQaQuestionDate(Date qaQuestionDate) {
		this.qaQuestionDate = qaQuestionDate;
	}

	public String getQaAnswer() {
		return qaAnswer;
	}

	public void setQaAnswer(String qaAnswer) {
		this.qaAnswer = qaAnswer;
	}

	public Date getQaAnswerDate() {
		return qaAnswerDate;
	}

	public void setQaAnswerDate(Date qaAnswerDate) {
		this.qaAnswerDate = qaAnswerDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getQacateNo() {
		return qacateNo;
	}

	public void setQacateNo(int qacateNo) {
		this.qacateNo = qacateNo;
	}

	public String getQacateName() {
		return qacateName;
	}

	public void setQacateName(String qacateName) {
		this.qacateName = qacateName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "QABoard [qaNo=" + qaNo + ", qaTitle=" + qaTitle + ", qaContent=" + qaContent + ", qaQuestionDate="
				+ qaQuestionDate + ", qaAnswer=" + qaAnswer + ", qaAnswerDate=" + qaAnswerDate + ", userNo=" + userNo
				+ ", userName=" + userName + ", qacateNo=" + qacateNo + ", qacateName=" + qacateName + ", status="
				+ status + "]";
	}

	
}
