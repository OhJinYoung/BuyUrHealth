/**
 * 
 */
package QABoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import static common.JDBCTemplate.*;
import QABoard.model.dao.QABoardDAO;
import QABoard.model.vo.QAFile;
import QABoard.model.vo.PageInfo;
import QABoard.model.vo.QABoard;


public class QABoardService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new QABoardDAO().getListCount(conn);
		
		close(conn);
		
		return listCount;

	}

	public ArrayList<QABoard> selectList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		
		ArrayList<QABoard> list = new QABoardDAO().selectList(conn, pi, userNo);
		
		close(conn);
		
		return list;

	}

	public QABoard selectBoard(int bId) {
		Connection conn = getConnection();
		
		QABoardDAO qabDAO = new QABoardDAO();
		
		QABoard qaboard = null;
		
		qaboard = qabDAO.selectBoard(conn, bId);
		
		if(qaboard != null) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return qaboard;

	}
	
	public ArrayList<QAFile> selectFile(int bId) {
		
		Connection conn = getConnection();
		
		ArrayList<QAFile> list = new QABoardDAO().selectFile(conn, bId);
		
		return list;
	}
	
	public int insertBoard(QABoard b) {
		Connection conn = getConnection();
		
		QABoardDAO dao = new QABoardDAO();
		
		int result = dao.insertBoard(conn, b); 

		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertBoard(QABoard b, ArrayList<QAFile> fileList) {
		Connection conn = getConnection();
		
		QABoardDAO dao = new QABoardDAO();
		
		int result1 = dao.insertBoard(conn, b); 
		int result2 = dao.insertFile(conn, fileList);

		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;

	}
	
	
	public int updateBoard(QABoard b) {
		Connection conn = getConnection();
		
		QABoardDAO dao = new QABoardDAO();
		
		int result1 = dao.updateBoard(conn, b); 

		
		if(result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int deleteBoard(int bId) {
		Connection conn = getConnection();
		
		int result = new QABoardDAO().deleteBoard(conn, bId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	

	

	


}
