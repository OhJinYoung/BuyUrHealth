package Cart.model.dao;

import static common.JDBCTemplate.*;

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

import Cart.model.vo.Cart;
import product.model.vo.ProductFile;


public class CartDAO {

private Properties prop = new Properties();
	
	public CartDAO() {
		String filePath = CartDAO.class.getResource("/sql/cart/cart-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertCart(Connection conn, Cart c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCart");
		// insertCart=INSERT INTO CART VALUES(co_seq.NEXTVAL, ?, ?, ?)
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, c.getCartVolume());
			pstmt.setInt(2, c.getUserNo());
			pstmt.setInt(3, c.getProductNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Cart> selectList(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cart> list = new ArrayList<Cart>();
		
		String query = prop.getProperty("selectList");
		// selectList=SELECT * FROM CARTLIST WHERE USER_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			

			while(rset.next()) {
				Cart cart = new Cart(rset.getInt("CART_NO"),
						rset.getString("PRODUCT_NAME"),
						rset.getInt("PRODUCT_VOLUME"),
						rset.getInt("CART_VOLUME"),
						rset.getInt("PRODUCT_PRICE"),
						rset.getInt("USER_NO"),
						rset.getInt("PRODUCT_NO"));
				
				list.add(cart);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	
	
	public int updateVol(Connection conn, Cart c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateVol");
		// updateVol=UPDATE CART SET CART_VOLUME=? WHERE PRODUCT_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, c.getCartVolume());
			pstmt.setInt(2, c.getProductNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}

	public int deleteCart(Connection conn, int proNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCart");
		// 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, proNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}


	public ArrayList<ProductFile> selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ProductFile> list = null;
		
		String query = prop.getProperty("selectFList");
		// selectFList=SELECT * FROM ADDFILE WHERE F_YN ='Y'

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<ProductFile>();
			while(rset.next()) {
				list.add(new ProductFile( 
						rset.getInt("PRODUCT_NO"),
						rset.getString("CHANGE_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}


	


}