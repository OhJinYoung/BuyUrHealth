package member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;
	private String password;
	private char gender;
	private String userId;
	private String userName;
	private Date birth;
	private String phone;
	private String email;
	private Date userDate;
	private char authority;
	private String status;
	private String Birthyy;
	private String Birthmm;
	private String Birthdd;

	
	public Member(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}
	
	public Member(int userNo, String password, char gender, String userId, String userName, Date birth,
			String phone,String email, Date userDate, char authority, String status) {
		super();
		this.userNo = userNo;
		this.password = password;
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
	public Member(String password, char gender, String userId, String userName, Date birth,
			String phone,String email, Date userDate, char authority, String status) {
		super();
		this.password = password;
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
	public Member(String password, char gender, String userId, String userName, Date birth,
			String phone,String email, Date userDate) {
		super();
		this.password = password;
		this.gender = gender;
		this.userId = userId;
		this.userName = userName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.userDate = userDate;
	}
	



	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getBirthyy() {
		return Birthyy;
	}

	public void setBirthyy(String birthyy) {
		Birthyy = birthyy;
	}

	public String getBirthmm() {
		return Birthmm;
	}

	public void setBirthmm(String birthmm) {
		Birthmm = birthmm;
	}

	public String getBirthdd() {
		return Birthdd;
	}

	public void setBirthdd(String birthdd) {
		Birthdd = birthdd;
	}

	

	

}
