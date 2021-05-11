package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import common.PageInfo;
import member.model.vo.Member;

public class MemberDAO {
	private Properties prop = new Properties();

	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;

		String query = prop.getProperty("loginMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getPassword());
			rset = pstmt.executeQuery();

			if (rset.next()) {
				System.out.println(rset);
				loginUser = new Member(rset.getInt("USER_NO"), 
						rset.getString("password"),
						rset.getString("GENDER").charAt(0), 
						rset.getString("USER_ID"), 
						rset.getString("USER_NAME"),
						rset.getString("birth"), 
						rset.getString("PHONE"), 
						rset.getString("EMAIL"),
						rset.getString("USER_DATE"), 
						rset.getString("AUTHORITY").charAt(0), 
						rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return loginUser;

	}

	public Member selectMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;

		String query = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				member = new Member(rset.getInt("USER_NO"), rset.getString("password"),
						rset.getString("GENDER").charAt(0), rset.getString("USER_ID"), rset.getString("USER_NAME"),
						rset.getString("birthdate"), rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getString("userdate"), rset.getString("AUTHORITY").charAt(0), rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public ArrayList<Member> memberList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();

		String query = prop.getProperty("memberList");

		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getPageLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Member member = new Member(rset.getInt("USER_NO"), rset.getString("USER_ID"),
						rset.getString("USER_NAME"), rset.getString("userdate"), rset.getInt("comm"), rset.getInt("rp"),
						rset.getInt("qa"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Member> searchMember(Connection conn, String filter, String input, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();

		String query = prop.getProperty("searchMember" + filter);

		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getPageLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + input + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member member = new Member(rset.getInt("USER_NO"), rset.getString("USER_ID"),
						rset.getString("USER_NAME"), rset.getString("userdate"), rset.getInt("comm"), rset.getInt("rp"),
						rset.getInt("qa"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deleteMembers(Connection conn, String[] members) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteMembers");

		try {
			pstmt = conn.prepareStatement(query);
			int i = 1;
			for (String s : members)
				pstmt.setString(i++, s);
			while (i < 11)
				pstmt.setString(i++, members[0]);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getGender() + "");
			pstmt.setString(2, member.getUserName());
			pstmt.setString(3, member.getBirth());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			pstmt.setInt(6, member.getUserNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMypageMember(Connection conn, Member myInfo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMypageMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myInfo.getGender() + "");
			pstmt.setString(2, myInfo.getUserId());
			pstmt.setString(3, myInfo.getUserName());
			pstmt.setString(4, myInfo.getPhone());
			pstmt.setString(5, myInfo.getEmail());
			pstmt.setInt(6, myInfo.getUserNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updatePwd");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int listCount(Connection conn, String filter, String input) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("listCount" + filter);

		try {
			pstmt = conn.prepareStatement(query);
			if (filter != "")
				pstmt.setString(1, "%" + input + "%");
			rset = pstmt.executeQuery();
			if (rset.next())
				result = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Member> adminList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();
		String query = prop.getProperty("adminList");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member member = new Member(rset.getInt("user_no"),rset.getString("user_id"),rset.getString("user_name"),rset.getString("email"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int insertAdmin(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertAdmin");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getGender()+"");
			pstmt.setString(3, member.getUserId());
			pstmt.setString(4, member.getUserName());
			pstmt.setString(5, member.getBirth());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		

		String query = prop.getProperty("insertMember");

		try {

			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getGender() +"");
			pstmt.setString(3, member.getUserId());
			pstmt.setString(4, member.getUserName());
			pstmt.setString(5, member.getBirth());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getEmail());

			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}

	public int checkId(Connection conn, String inputId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		 
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public Member idFindInfoMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member UserInfo = null;
		
		String query = prop.getProperty("UserInfoFind");
		
			try {
				
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, member.getUserName());
				pstmt.setString(2, member.getEmail());
				pstmt.setString(3, member.getPhone());
				
				
				rset = pstmt.executeQuery();
				if (rset.next()) {
					UserInfo = new Member(
							rset.getString("USER_ID"), 
							rset.getString("USER_NAME"),
							rset.getString("PHONE"), 
							rset.getString("EMAIL"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			System.out.println(UserInfo);
		
		
		return UserInfo;
	}

	public Member pwFindInfoMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member UserInfo2 = null;
		
		String query = prop.getProperty("UserInfoFinds");
		
			try {
				
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, member.getUserId());
				pstmt.setString(2, member.getUserName());
				pstmt.setString(3, member.getEmail());
				pstmt.setString(4, member.getPhone());
				
				
				rset = pstmt.executeQuery();
				if (rset.next()) {
					UserInfo2 = new Member(
							rset.getString("PASSWORD"), 
							rset.getString("USER_ID"), 
							rset.getString("USER_NAME"),
							rset.getString("PHONE"), 
							rset.getString("EMAIL"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
		
		return UserInfo2;
	}
}