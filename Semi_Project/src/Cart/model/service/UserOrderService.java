package Cart.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import Cart.model.dao.UserOrderDAO;
import Cart.model.vo.UserOrder;

public class UserOrderService {
	
	public int insertOrderInfo(UserOrder o) {
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

	public UserOrder detailOrder(int no) {
		Connection conn = getConnection();
		
		
		UserOrder order = new UserOrderDAO().detailOrder(conn, no);
		
		if(order == null) {
			rollback(conn);
		} else {
			commit(conn);
		}
		
		close(conn);
		
		return order;

	}

}
