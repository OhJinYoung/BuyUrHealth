package Cart.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import Cart.model.service.OrderService;
import Cart.model.vo.Order;

public class OrderDAO {
	private Properties prop = new Properties();

	public OrderDAO() {
		String fileName = OrderDAO.class.getResource("/sql/cart/cart-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	
	public int insertOrderInfo(Connection conn, Order o) {
		int order_No = (int)(Math.random()*10000000)+1;
		
		System.out.println(order_No);
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderInfo");
		// insertOrderInfo=INSERT INTO ORDERLIST VALUES(?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?)
		// order_no r_name r_address r_phone request payment state order_date user_no r_email
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, o.getOrderNo());
			pstmt.setString(2, o.getName());
			pstmt.setString(3, o.getAddress());
			pstmt.setString(4, o.getPhone());
			pstmt.setString(5, o.getRequest());
			pstmt.setString(6, "-");
			pstmt.setString(7, "결제대기");
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


	public int payInfo(Connection conn, Order o) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateOrderInfo");
		// updateOrderInfo=UPDATE ORDERLIST SET PAYMENT=? AND STATE=? WHERE ORDER_NO=?
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, o.getPayment());
			pstmt.setString(2, o.getState());
			pstmt.setInt(3, o.getOrderNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
