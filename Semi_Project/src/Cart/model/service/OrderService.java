package Cart.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import Cart.model.dao.OrderDAO;
import Cart.model.vo.Order;

public class OrderService {
	
	public int insertOrderInfo(Order o) {
		Connection conn = getConnection();

		int result = new OrderDAO().insertOrderInfo(conn, o);

		close(conn);

		return result;
	}

	public int payInfo(Order o) {
		Connection conn = getConnection();

		int result = new OrderDAO().payInfo(conn, o);

		close(conn);

		return result;
	}
	
}
