package Cart.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import Cart.model.dao.CartDAO;
import Cart.model.dao.UserOrderDAO;
import Cart.model.vo.Cart;
import product.model.vo.ProductFile;

public class CartService {

	public int insertCart(Cart c) {
		Connection conn = getConnection();
		
		
		int result = new CartDAO().insertCart(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}

	public ArrayList<Cart> selectList(int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = new CartDAO().selectList(conn, userNo);
		
		close(conn); 
		
		return list;

	}

	public int updateVol(Cart c) {
		Connection conn = getConnection();
		
		int result = new CartDAO().updateVol(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;

	}

	public int deleteCart(int proNo) {
		Connection conn = getConnection();
		
		int result = new CartDAO().deleteCart(conn, proNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;

	}
	
	public ArrayList<ProductFile> selectTList(int i) {
		Connection conn = getConnection();

		ArrayList<ProductFile> list = null;

		CartDAO cDAO = new CartDAO();
		if (i == 1) {
			list = cDAO.selectFList(conn);
		}

		return list;
	}





	

}
