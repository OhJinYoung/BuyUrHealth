package member.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;
import order.model.vo.Order;
import order.model.vo.RequestOrder;
import test.model.vo.Test;

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
						rset.getString("PASSWORD"),
						rset.getString("GENDER").charAt(0), 
						rset.getString("USER_ID"), 
						rset.getString("USER_NAME"),
						rset.getDate("BIRTH"), 
						rset.getString("PHONE"), 
						rset.getString("EMAIL"),
						rset.getDate("USER_DATE"), 
						rset.getString("AUTHORITY").charAt(0),
						rset.getString("STATUS"));
			}
			/*
			 * if (rset.next()) { System.out.println(rset); loginUser = new
			 * Member(rset.getString("USER_NO"), rset.getString("PASSWORD"),
			 * rset.getString("GENDER").charAt(0), rset.getString("USER_ID"),
			 * rset.getString("USER_NAME"), rset.getDate("BIRTH"), rset.getString("PHONE"),
			 * rset.getString("EMAIL"), rset.getDate("USER_DATE"),
			 * rset.getString("AUTHORITY").charAt(0), rset.getString("STATUS")); }
			 */		} catch (SQLException e) {
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
						rset.getDate("BIRTH"), rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getDate("USER_DATE"), rset.getString("AUTHORITY").charAt(0), rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return member;
	}

	public ArrayList<Member> memberList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();

		String query = prop.getProperty("memberList");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				Member member = new Member(rset.getInt("USER_NO"), rset.getString("password"),
						rset.getString("GENDER").charAt(0), rset.getString("USER_ID"), rset.getString("USER_NAME"),
						rset.getDate("BIRTH"), rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getDate("USER_DATE"), rset.getString("AUTHORITY").charAt(0), rset.getString("STATUS"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public ArrayList<Member> searchMember(Connection conn, String filter, String input) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();

		String query = prop.getProperty("searchMember" + filter);

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + input + "%");

			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member member = new Member(rset.getInt("USER_NO"), rset.getString("password"),
						rset.getString("GENDER").charAt(0), rset.getString("USER_ID"), rset.getString("USER_NAME"),
						rset.getDate("BIRTH"), rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getDate("USER_DATE"), rset.getString("AUTHORITY").charAt(0), rset.getString("STATUS"));
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
				pstmt.setInt(i++, Integer.parseInt(s));
			while (i < 11)
				pstmt.setInt(i++, Integer.parseInt(members[0]));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
			pstmt.setDate(5, (Date)(member.getBirth()));
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
	
	

	// String -> Date로 변경하는 메서드
    // 문자열로된 생년월일을 Date로 변경하기 위해 필요
    // java.util.Date클래스로는 오라클의 Date형식과 연동할 수 없다.
    // Oracle의 date형식과 연동되는 java의 Date는 java.sql.Date 클래스이다.
    public Date stringToDate(Member member)
    {
        String year = member.getBirthyy();
        String month = member.getBirthmm();
        String day = member.getBirthdd();
        
        Date birth = Date.valueOf(year+"-"+month+"-"+day);
        
        return birth;	
       
    } 




}
