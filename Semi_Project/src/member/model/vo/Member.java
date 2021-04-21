package member.model.vo;

import java.sql.Date;

public class Member {
	private String userNo;
	private String userPwd;
	private char gender;
	private String userId;
	private String userName;
	private Date birth;
	private String phone;
	private String email;
	private Date userDate;
	private char authority;
	private String status;

	public Member() {
	}

	public Member(String userNo, String userPwd, char gender, String userId, String userName, Date birth, String phone,
			String email, Date userDate, char authority, String status) {
		super();
		this.userNo = userNo;
		this.userPwd = userPwd;
		this.gender = gender;
		this.userId = userId;
		this.userName = userName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.userDate = userDate;
		this.authority = authority;
		this.status = status;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getUserDate() {
		return userDate;
	}

	public void setUserDate(Date userDate) {
		this.userDate = userDate;
	}

	public char getAuthority() {
		return authority;
	}

	public void setAuthority(char authority) {
		this.authority = authority;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
