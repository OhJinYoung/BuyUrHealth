package Board.model.service;

import static common.JDBCTemplate.*;
//import static common.JDBCTemplate.close;
//import static common.JDBCTemplate.commit;
//import static common.JDBCTemplate.getConnection;
//import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import Board.model.dao.CommunityDAO;
import Board.model.vo.AddFile;
import Board.model.vo.Community;
import Board.model.vo.Reply;


public class CommunityService {

//	public ArrayList<Community> selectList() {
//		Connection conn = getConnection();
//		
//		ArrayList<Community> list = new BoardDAO().selectList(conn);
//		
//		close(conn);
//		
//		return list;
//	}  // 상세 보기할대 필요할듯..? 

	public int insertBoard(Community c) {
		Connection conn = getConnection();
		
		int result = new CommunityDAO().insertBoard(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
//		close(conn);		
		return result;
	}


	public int insertThumbnail(Community c, ArrayList<AddFile> fileList) {
		Connection conn = getConnection();
		
		CommunityDAO dao = new CommunityDAO();
		
		int result1 = dao.insertBoard(conn, c);
		int result2 = dao.insertAddFile(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
//		close(conn);		
		return result1;
	}

	public Community selectBoard(int bId) {
		Connection conn = getConnection();
		
		CommunityDAO dao = new CommunityDAO();  // 두번 다녀와야함 1.조회수 증가 2.셀렉트
		
		int result = dao.updateCount(conn, bId);
		
		Community community = null;
		if(result > 0) { // 업데이트 잘 됐다고 하면
			community = dao.selectBoard(conn, bId);
			
			if(community != null) { 
				commit(conn);
			} else {
				rollback(conn);
			}
		} else { // result가 0보다 작다고해도 롤백 해줘야 함
			rollback(conn);
		}
				
		return community;
	}

	public ArrayList<AddFile> selectThumbnail(int bId) {
		Connection conn = getConnection();
		
		ArrayList<AddFile> list = new CommunityDAO().selectThumbnail(conn, bId);
		
		return list;
	}
	
	
	public ArrayList<Reply> selectReplyList(int bId) {  // ajax하면서 댓글 추가한 부분
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new CommunityDAO().selectReplyList(conn, bId);  // DAO랑 연결
		
		return list;
	}

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		CommunityDAO bDAO = new CommunityDAO();
		
		int result = bDAO.insertReply(conn, r);
		
		ArrayList<Reply> list = null;
		if(result > 0) {
			commit(conn);
			list = bDAO.selectReplyList(conn, r.getRefBId()); // bid는 getRefBId()안에 존재
		} else {
			rollback(conn);
		}
		
		return list;
	}


	public ArrayList selectCList(int i) {
		Connection conn = getConnection();
		
		ArrayList list = null;
		
		CommunityDAO bDAO = new CommunityDAO();  
		if(i == 30) {   // 30 자유
			list = bDAO.selectcList(conn);  // 게시판조회
		} else { //  20 후기
			list = bDAO.selectfList(conn); // 사진조회
		}
		close(conn);		
		return list;
	}
}
