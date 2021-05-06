package Cart.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import Cart.model.dao.OrderDAO;
import Cart.model.vo.Order;

public class OrderService {
	
	public int insertOrderInfo(Order o) {
		Connection conn = getConnection();

		int result = new OrderDAO().insertOrderInfo(conn, o);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}

	public Order detailOrder(int no) {
		Connection conn = getConnection();
		
		
		Order order = new OrderDAO().detailOrder(conn, no);
		
		if(order == null) {
			rollback(conn);
		} else {
			commit(conn);
		}
		
		close(conn);
		
		return order;

	}

}
