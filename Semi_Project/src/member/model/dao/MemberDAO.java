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

import member.model.vo.Member;

public class MemberDAO {
	private Properties prop = new Properties();
	private DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");

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
				loginUser = new Member(rset.getInt("USER_NO"), rset.getString("PASSWORD"),
						rset.getString("GENDER").charAt(0), rset.getString("USER_ID"), rset.getString("USER_NAME"),
						rset.getString("birthdate"), rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getString("USERDATE"), rset.getString("AUTHORITY").charAt(0), rset.getString("STATUS"));
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

	public ArrayList<Member> memberList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();

		String query = prop.getProperty("memberList");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

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

}
