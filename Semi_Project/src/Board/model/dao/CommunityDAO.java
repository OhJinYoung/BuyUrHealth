package Board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import Board.model.vo.AddFile;
import Board.model.vo.Community;
import Board.model.vo.Reply;

public class CommunityDAO {

	private Properties prop = new Properties();
	
	public CommunityDAO() {
		String filePath = CommunityDAO.class.getResource("/sql/board/board-query.properties").getPath(); // 경로가져옴
		
		try {
			prop.load(new FileReader(filePath)); 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public int insertBoard(Connection conn, Community c) {  // 보드 게시판 생성
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
//insertBoard=INSERT INTO BOARD VALUES(COMM_SEQ.NEXTVAL, ?, ?, SYSDATE, DEFAULT, DEFAULT)	// ***
		try {
			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, b.getBoardType());
//			pstmt.setInt(2, Integer.parseInt(b.getCategory()));
//			pstmt.setString(3, b.getBoardTitle());
//			pstmt.setString(4, b.getBoardContent());
//			pstmt.setString(5, b.getBoardWriter());   -> 내용 고쳐놓을것!!!!!!!!!!!!!
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList selectBList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Community> list = null;
		
		String query = prop.getProperty("selectBList");
// SELECT * FROM BLIST WHERE BOARD_TYPE=2		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Community>(); // 객체생성
			while(rset.next()) {
				list.add(new Community(rset.getInt("COMM_NO"),
									rset.getString("COMM_TITLE"),
									rset.getString("COMM_CONTENT"),
									rset.getDate("COMM_DATE"),
									rset.getInt("USER_NO"),
									rset.getInt("CTG_NO"))); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}



	public int insertAddFile(Connection conn, ArrayList<AddFile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				AddFile af = fileList.get(i);
				
//				pstmt = conn.prepareStatement(query);
//				pstmt.setString(1, at.getOriginName());
//				pstmt.setString(2, at.getChangeName());
//				pstmt.setString(3, at.getFilePath());
//				pstmt.setInt(4, at.getFileLevel());  // 안에 내용 고치기!!!!!!!
				 
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCount(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
// updateCount=UPDATE BOARD SET BOARD_COUNT = BOARD_COUNT + 1 WHERE BOARD_ID = ?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Community selectBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Community c = null;
		
		String query = prop.getProperty("selectBoard");
//selectBoard=SELECT * FROM BDETAIL WHERE BOARD_ID = ?

/* SQL에서 작성해보면 
   CREATE OR REPLACE VIEW BDETAIL  -> 밑에 내용 다 쓰기엔 기니까,  BDETAIL를 만들어줌
	AS
	SELECT BOARD_ID, BOARD_TYPE, CATE_NAME, BOARD_TITLE, BOARD_CONTENT, BOARD_WRITER,
        NICKNAME, BOARD_COUNT, CREATE_DATE, BOARD.MODIFY_DATE, BOARD.STATUS
	FROM BOARD
    	JOIN MEMBER ON (USER_ID = BOARD_WRITER)
    	JOIN CATEGORY USING(CATE_ID)
	WHERE BOARD_ID = 101
    	AND BOARD.STATUS = 'Y';
    
SELECT * FROM BDETAIL  -> BDETAIL만 불러와서 사용 가능하게 
WHERE BOARD_ID = 101;  */		

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
//				c = new Community(rset.getInt("BOARD_ID"),
//								rset.getInt("BOARD_TYPE"), 
//								rset.getString("CATE_NAME"),
//								rset.getString("BOARD_TITLE"),
//								rset.getString("BOARD_CONTENT"),
//								rset.getString("BOARD_WRITER"),
//								rset.getString("NICKNAME"),
//								rset.getInt("BOARD_COUNT"),
//								rset.getDate("CREATE_DATE"),
//								rset.getDate("MODIFY_DATE"),
//								rset.getString("STATUS"));  // 내용수정
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}

	public ArrayList<AddFile> selectThumbnail(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AddFile> list = null;
		
		String query = prop.getProperty("selectThumbnail");
//selectThumbnail=SELECT * FROM ATTACHMENT WHERE BOARD_ID = ? AND STATUS='Y' ORDER BY FILE_ID		
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<AddFile>(); // 객체 하나 만들어주고
			while(rset.next()) {  // 다음 값이 있으면
				AddFile af = new AddFile(); // 객체생성
//				at.setFileId(rset.getInt("FILE_ID"));
//				at.setOriginName(rset.getString("ORIGIN_NAME"));
//				at.setChangeName(rset.getString("CHANGE_NAME"));
//				at.setFilePath(rset.getString("FILE_PATH"));  // 내용수정
				
				list.add(af);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int bId) {  // ajax하면서 댓글 추가한 부분
		//dao구현하는데, 먼저 쿼리부터 생각하기  / vo에서 nickname을 집어넛었는데 reply엔 없으니까 member랑 조인해야 함
/* 
create or replace view rlist
as
select reply_id, reply_content, ref_bid, reply_writer, nickname, create_date, reply.modify_date, reply.status
from reply
    join member on (user_id = reply_writer)
where  reply.status='Y'  
order by reply_id desc;

select * from rlist where ref_bid = 101;  */		
		
		// select * from rlist where ref_bid = ?
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> rList = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			rList = new ArrayList<Reply>();
			while(rset.next()) {
//				rList.add(new Reply(rset.getInt("REPLY_ID"),
//									rset.getString("REPLY_CONTENT"),
//									rset.getInt("REF_BID"),
//									rset.getString("REPLY_WRITER"),
//									rset.getString("NICKNAME"),
//									rset.getDate("CREATE_DATE"),
//									rset.getDate("MODIFY_DATE"), 
//									rset.getString("STATUS")));  // 내용수정
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rList;
	}

	public int insertReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
// INSERT INTO REPLY VALUES(SEQ_RID.NEXTVAL, ?, ?, ?, SYSDATE, SYSDATE, DEFAULT)	
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefBId());
			pstmt.setString(3, r.getReplyWriter());
			
			result = pstmt.executeUpdate();  // int값을 반환하는
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList selectfList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<AddFile> list = null;
		
		String query = prop.getProperty("selectfList");
// selectFList=SELECT * FROM ATTACHMENT WHERE STATUS='Y' AND FILE_LEVEL=0
// selectFList조회 -> 사진게시판의 목록을 불러온다는 건 :		
// FILE_LEVEL=0 -> 0으로 두는 이유 :	썸네일로 비춰질 사진인지, 내용안에 	들어갈 사진인지 구분해주는것 -> 0: 썸네일/ 1:내용 사진
// => 썸네일만 가져오겠다는 Flist가 필요한 것		
 
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<AddFile>();
			while(rset.next()) { // 게시글의 리스트를 조회해오는 것이기 때문에, 사진이 여러개일 수 잇으니 while사용 
								// (전체 게시글의 썸네일을 가져오는 것이기에 여러개 일 수 있음)
				list.add(new AddFile(rset.getInt("COMM_NO"), // BOARD_ID : 어떤 게시글에 속했는지 
										rset.getString("CHANGE_NAME"))); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}


	public ArrayList selectcList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Community> list = null;
		
		String query = prop.getProperty("selectcList");
// SELECT * FROM BLIST WHERE BOARD_TYPE=2		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Community>(); // 객체생성
			while(rset.next()) {
				list.add(new Community(rset.getInt("COMM_NO"),
									rset.getString("COMM_TITLE"),
									rset.getString("COMM_CONTENT"),
									rset.getDate("COMM_DATE"),
									rset.getInt("USER_NO"),
									rset.getInt("CTG_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
}	
