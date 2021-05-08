package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;
import notice.model.vo.PageInfo;

/* service의 역할 
 * - Controller에 의해 호출되어 실제 비즈니스 로직과 트랜잭션을 처리하고, 
 * DB CRUD(Persistence)를 담당하는 DAO 객체를 Spring 으로부터 주입 받아서, 
 * DAO에 DB CRUD 처리를 위임하고, 처리 결과를 Controller에게 반환합니다.
 - Service @Service, @Transactional, @Autowired 비즈니스 로직과 트랜잭션 처리합니다.
 */

public class NoticeService {
	
	public int getListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new NoticeDAO().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Notice> selectList(PageInfo pi) {
		// Service에서 가장 먼저 할일은 Connnection받아오기
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDAO().selectList(conn, pi);
		
		close(conn);
		
		return list;
		
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		return result;
	}

	public Notice selectNotice(int no) {
		
		Connection conn = getConnection();
		
		Notice notice = new NoticeDAO().selectNotice(conn, no);
		
		close(conn);
		
		return notice;
		
		
		
		
	}



	public int updateNotice(Notice notice) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDAO().updateNotice(conn, notice);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int deleteNotice(int no) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDAO().deleteNotice(conn, no);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}


}
