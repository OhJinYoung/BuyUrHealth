package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import order.model.dao.OrderDAO;
import order.model.vo.Order;
import order.model.vo.RequestOrder;

public class OrderService {

	public ArrayList<Order> orderList() {
		Connection conn = getConnection();

		ArrayList<Order> list = new OrderDAO().orderList(conn);

		close(conn);

		return list;
	}

	public ArrayList<Order> searchOrder(String filter, String input) {
		Connection conn = getConnection();

		ArrayList<Order> list = new OrderDAO().searchOrder(conn, filter, input);

		close(conn);

		return list;
	}

	public int updateOrder(String select, String[] check) {
		Connection conn = getConnection();

		int result = new OrderDAO().updateOrder(conn, select, check);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public RequestOrder selectRequest(int no) {
		Connection conn = getConnection();

		RequestOrder req = new OrderDAO().selectRequest(conn, no);

		close(conn);

		return req;
	}

	public int updateRequest(int no, String state) {
		Connection conn = getConnection();

		int result = new OrderDAO().updateRequest(conn, no, state);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);

		return result;
	}
}
