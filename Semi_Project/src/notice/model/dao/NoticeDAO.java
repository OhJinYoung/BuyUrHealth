package notice.model.dao;

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

import notice.model.vo.Notice;
import notice.model.vo.PageInfo;

public class NoticeDAO {
	
	//NoticeDAO에서도 기본생성자를 만들어줘야함
	// 기본생성자 만드는 이유 : sql에 담겨있는 properties 파일을 불러오기 위해 기본생성자를 만듬 
	private Properties prop = new Properties();
	
	public NoticeDAO() {
		// properties의 경로 가져오기 
		String fileName = NoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();

		
		// 파일 불러오기
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);  // 첫번째 값을 가져옴 
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	

	public ArrayList<Notice> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getNoticeLimit() + 1; 
			int endRow = startRow + pi.getNoticeLimit() - 1;
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Notice>();
			while(rset.next()) {
				Notice no = new Notice(rset.getInt("COMM_NO"),
									   rset.getString("COMM_TITLE"),
									   rset.getString("COMM_CONTENT"),
									   rset.getDate("COMM_DATE"),
									   rset.getString("USER_ID"),
									   rset.getInt("CTG_NO"));
					list.add(no);			   
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		/*
		    GRANT CREATE VIEW TO BUH;   // system 계정으로 권한을 준 뒤 


			CREATE OR REPLACE VIEW NLIST
			AS
			SELECT ROWNUM RNUM, DESCNOTICE.*
			FROM(SELECT COMM_NO, COMM_TITLE, COMM_CONTENT, COMM_DATE, USER_ID, CTG_NO 
			FROM COMMUNITY 
			JOIN MEMBERLIST ON (COMMUNITY.USER_NO = MEMBERLIST.USER_NO) ORDER BY COMM_NO DESC) DESCNOTICE;
			
			SELECT * FROM NLIST
			WHERE RNUM >= 5 AND RNUM <= 10;
			
			
		 */
		
		
		
		
		
	}



	public int insertNotice(Connection conn, Notice n) {
		//들어가는게 많기 때문에 PreparedStatement
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		
		//sql ? 에 들어갈값 넣기
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setDate(3, n.getNoticeDate());
			pstmt.setString(4, n.getNoticeWrtier());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	public Notice selectNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice notice = null;
		
		String query = prop.getProperty("selectNotice");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				notice = new Notice(rset.getInt("COMM_NO"),
						   rset.getString("COMM_TITLE"),
						   rset.getString("COMM_CONTENT"),
						   rset.getDate("COMM_DATE"),
						   rset.getString("USER_ID"),
						   rset.getInt("CTG_NO"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return notice;
	}





	public int updateNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotie");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,  notice.getNoticeTitle());
			pstmt.setString(2,  notice.getNoticeContent());
			pstmt.setDate(3,  notice.getNoticeDate());
			pstmt.setInt(4,  notice.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,  no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
