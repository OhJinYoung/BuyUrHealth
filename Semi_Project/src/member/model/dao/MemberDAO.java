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
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;
import member.model.vo.Order;

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
				member = new Member(rset.getString("USER_NO"), rset.getString("password"),
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
				Member member = new Member(rset.getString("USER_NO"), rset.getString("password"),
						rset.getString("GENDER").charAt(0), rset.getString("USER_ID"), rset.getString("USER_NAME"),
						rset.getDate("BIRTH"), rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getDate("USER_DATE"), rset.getString("AUTHORITY").charAt(0), rset.getString("STATUS"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return list;
	}

	public ArrayList<Order> orderList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Order> list = new ArrayList<>();

		String query = prop.getProperty("orderList");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				Order order = new Order(rset.getInt("order_no"), rset.getString("state"), rset.getDate("order_date"),
						rset.getString("user_name"), rset.getString("user_id"), rset.getString("productlist"),
						rset.getInt("price"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return list;
	}

	public ArrayList<Order> searchOrder(Connection conn, String filter, String input) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Order> list = new ArrayList<>();

		String query = prop.getProperty("searchOrder"+filter);

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+input+"%");
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Order order = new Order(rset.getInt("order_no"), rset.getString("state"), rset.getDate("order_date"),
						rset.getString("user_name"), rset.getString("user_id"), rset.getString("productlist"),
						rset.getInt("price"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}

}
