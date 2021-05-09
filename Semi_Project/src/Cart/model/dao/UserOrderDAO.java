package Cart.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import Cart.model.vo.Cart;
import order.model.vo.Order;

public class UserOrderDAO {
	private Properties prop = new Properties();

	public UserOrderDAO() {
		String fileName = UserOrderDAO.class.getResource("/sql/cart/cart-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	
	public int insertOrderInfo(Connection conn, Order o) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderInfo");
		// insertOrderInfo=INSERT INTO ORDERLIST VALUES(?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, null, ?)
		// order_no r_name r_address r_phone request payment state order_date user_no tracking_no r_email
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, o.getNo());
			pstmt.setString(2, o.getName());
			pstmt.setString(3, o.getAddress());
			pstmt.setString(4, o.getPhone());
			pstmt.setString(5, o.getRequest());
			pstmt.setString(6, "신용카드");
			pstmt.setString(7, "결제완료");
			pstmt.setInt(8, o.getUserNo());
			pstmt.setString(9, o.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}


	public Order detailOrder(Connection conn, int oNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Order order = null;
		
		String query = prop.getProperty("detailOrder");
		// detailOrder=SELECT USER_NAME, R_NAME, R_ADDRESS, R_PHONE, R_EMAIL, PAYMENT 
		// FROM ORDERLIST JOIN MEMBERLIST USING (USER_NO) WHERE ORDER_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, oNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				order = new Order(rset.getString("R_NAME"),
									rset.getString("R_ADDRESS"),
									rset.getString("R_PHONE"),
									rset.getString("PAYMENT"),
									rset.getString("USER_NAME"),
									rset.getString("R_EMAIL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return order;
	}


	public int updateOrderDetail(Connection conn, int orderNo, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateOrderDetail");
		// updateOrderDetail=UPDATE ORDER_DETAIL SET ORDER_NO=? WHERE USER_NO=?
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, orderNo);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int insertOrderDetail(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderDetail");
		// insertOrderDetail=INSERT INTO ORDER_DETAIL(OD_NO, OD_VOLUME, PRODUCT_NO, ORDER_NO) 
		// SELECT orderdetail_seq.nextval, CART_VOLUME, PRODUCT_NO, ORDER_NO 
		// FROM CART 
		// JOIN ORDERLIST USING(USER_NO);
		
		try {
			pstmt = conn.prepareStatement(query);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}




	
}
