package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.PageInfo;
import order.model.dao.OrderDAO;
import order.model.vo.Order;
import order.model.vo.OrderDetail;
import order.model.vo.RequestOrder;

public class OrderService {

	public ArrayList<Order> orderList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Order> list = new OrderDAO().orderList(conn, pi);

		close(conn);

		return list;
	}

	public ArrayList<Order> searchOrder(String filter, String input, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Order> list = new OrderDAO().searchOrder(conn, filter, input, pi);

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

		OrderDAO oDAO = new OrderDAO();
		int result = oDAO.updateRequest(conn, no, state);

		if (result > 0) {
			result = oDAO.updateDisposeDate(conn, no);
		}

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int listCount(String filter, String input) {
		Connection conn = getConnection();

		int result = new OrderDAO().listCount(conn, filter, input);

		close(conn);

		return result;
	}

	public Order selectOrder(int no) {
		Connection conn = getConnection();

		Order order = new OrderDAO().selectOrder(conn, no);

		close(conn);

		return order;
	}

	public ArrayList<OrderDetail> selectOrderDetail(int no) {
		Connection conn = getConnection();

		ArrayList<OrderDetail> olist = new OrderDAO().selectOrderDetail(conn, no);

		close(conn);

		return olist;
	}

	public int updateTrackingNo(int orderNo, String trackingNo) {
		Connection conn = getConnection();

		int result = new OrderDAO().updateTrackingNo(conn, orderNo, trackingNo);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

}