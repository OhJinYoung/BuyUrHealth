package member.model.vo;

public class Member {
	private int userNo;
	private String password;
	private char gender;
	private String userId;
	private String userName;
	private String birth;
	private String phone;
	private String email;
	private String userDate;
	private char authority;
	private String status;
	private int countComm;
	private int countReply;
	private int countQna;
	
	public Member() {
	}
	
	public Member(String email) {
		this.email = email;
	}
	public Member(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}
	public Member(String userName, String email, String phone) {
		this.userName = userName;
		this.email = email;	
		this.phone = phone;
	}
	public Member(int userNo, String userId, String userName, String email) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.email = email;
	}
	public Member(String userId, String userName, String email, String phone) {
		this.userId = userId;
		this.userName = userName;
		this.email = email;	
		this.phone = phone;
	}
	public Member(String password, String userId, String userName, String email, String phone ) {
		this.password = password;
		this.userId = userId;
		this.userName = userName;
		this.email = email;	
		this.phone = phone;
	}

	

	public Member(String password, char gender, String userId, String userName, String birth, String phone, String email) {
		super();
		this.password = password;
		this.gender = gender;
		this.userId = userId;
		this.userName = userName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
	}

	public Member(int userNo, String userId, String userName, String userDate, int countComm, int countReply,
			int countQna) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userDate = userDate;
		this.countComm = countComm;
		this.countReply = countReply;
		this.countQna = countQna;
	}

	public Member(int userNo, char gender, String userName, String birth, String phone, String email) {
		super();
		this.userNo = userNo;
		this.gender = gender;
		this.userName = userName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
	}

	public Member(int userNo, String password, char gender, String userId, String userName, String birth, String phone,
			String email, String userDate, char authority, String status) {
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
	public Member(String password, char gender, String userId, String userName, String birth, String phone,
			String email, String userDate, char authority, String status) {
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

	public Member(int userNo, String password, char gender, String userId, String userName, String birth, String phone,
			String email, String userDate, char authority, String status, int countComm, int countReply, int countQna) {
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
		this.countComm = countComm;
		this.countReply = countReply;
		this.countQna = countQna;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
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

	public String getUserDate() {
		return userDate;
	}

	public void setUserDate(String userDate) {
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

	public int getCountComm() {
		return countComm;
	}

	public void setCountComm(int countComm) {
		this.countComm = countComm;
	}

	public int getCountReply() {
		return countReply;
	}

	public void setCountReply(int countReply) {
		this.countReply = countReply;
	}

	public int getCountQna() {
		return countQna;
	}

	public void setCountQna(int countQna) {
		this.countQna = countQna;
	}

}
