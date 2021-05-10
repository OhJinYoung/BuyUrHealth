package Cart.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import Cart.model.dao.UserOrderDAO;
import Cart.model.vo.Cart;
import order.model.vo.Order;
import order.model.vo.OrderDetail;

public class UserOrderService {
	
	public int insertOrderInfo(Order o) {
		Connection conn = getConnection();

		int result = new UserOrderDAO().insertOrderInfo(conn, o);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}

	public Order detailOrder(int oNo) {
		Connection conn = getConnection();
		
		Order order = new UserOrderDAO().detailOrder(conn, oNo);
		
		if(order == null) {
			rollback(conn);
		} else {
			commit(conn);
		}
		
		close(conn);
		
		return order;

	}

	public int updateOrderDetail(int orderNo, int userNo) {
		Connection conn = getConnection();

		int result = new UserOrderDAO().updateOrderDetail(conn, orderNo, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}

	public int insertOrderDetail(int orderNo) {
		Connection conn = getConnection();
		
		int result = new UserOrderDAO().insertOrderDetail(conn, orderNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}


}
