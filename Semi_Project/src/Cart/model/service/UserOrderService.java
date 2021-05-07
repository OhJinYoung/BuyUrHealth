package Cart.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import Cart.model.dao.UserOrderDAO;
import order.model.vo.Order;

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

}
