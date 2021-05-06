package order.model.dao;

import static common.JDBCTemplate.close;

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

import common.PageInfo;
import order.model.vo.Order;
import order.model.vo.OrderDetail;
import order.model.vo.RequestOrder;

public class OrderDAO {
	private Properties prop = new Properties();

	public OrderDAO() {
		String fileName = OrderDAO.class.getResource("/sql/order/order-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<Order> orderList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Order> list = new ArrayList<>();

		String query = prop.getProperty("orderList");

		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getPageLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Order order = new Order(rset.getInt("order_no"), rset.getString("state"), rset.getString("orderdate"),
						rset.getString("user_name"), rset.getString("user_id"), rset.getString("productlist"),
						rset.getInt("price"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Order> searchOrder(Connection conn, String filter, String input, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Order> list = new ArrayList<>();

		String query = prop.getProperty("searchOrder" + filter);

		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getPageLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + input + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Order order = new Order(rset.getInt("order_no"), rset.getString("state"), rset.getString("orderdate"),
						rset.getString("user_name"), rset.getString("user_id"), rset.getString("productlist"),
						rset.getInt("price"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateOrder(Connection conn, String select, String[] check) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateOrder");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, select);
			int i = 2;
			for (String s : check)
				pstmt.setString(i++, s);

			while (i < 12)
				pstmt.setString(i++, check[0]);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public RequestOrder selectRequest(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		RequestOrder req = new RequestOrder();
		String query = prop.getProperty("selectRequest");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				req.setNo(rset.getInt("request_no"));
				req.setOrderNo(no);
				req.setPayment(rset.getString("payment"));
				req.setPrice(rset.getInt("price"));
				req.setState(rset.getString("state"));
				req.setType(rset.getString("request_type"));
				req.setInfo(rset.getString("request_info"));
				req.setDate(rset.getString("requestdate"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return req;
	}

	public int updateRequest(Connection conn, int no, String state) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateRequest");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, state);
			pstmt.setInt(2, no);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateDisposeDate(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateDisposeDate");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int listCount(Connection conn, String filter, String input) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("listCount" + filter);

		try {
			pstmt = conn.prepareStatement(query);
			if (filter != "")
				pstmt.setString(1, "%" + input + "%");
			rset = pstmt.executeQuery();
			if (rset.next())
				result = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public Order selectOrder(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Order order = null;
		String query = prop.getProperty("selectOrder");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				order = new Order(rset.getInt("order_no"), rset.getString("r_name"), rset.getString("r_address"),
						rset.getString("r_phone"), rset.getString("request"), rset.getString("payment"),
						rset.getString("state"), rset.getString("orderdate"), rset.getString("user_name"),
						rset.getString("user_id"),rset.getString("tracking_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return order;
	}

	public ArrayList<OrderDetail> selectOrderDetail(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OrderDetail> olist = new ArrayList<OrderDetail>();
		String query = prop.getProperty("selectOrderDetail");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				OrderDetail od = new OrderDetail(rset.getInt("od_no"), rset.getInt("od_volume"),
						rset.getString("product_name"), rset.getInt("product_price"));
				
				olist.add(od);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return olist;
	}

}
