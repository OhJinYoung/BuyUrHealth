package QABoard.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import QABoard.model.vo.QAFile;
import QABoard.model.vo.PageInfo;
import QABoard.model.vo.QABoard;
import member.model.vo.Member;

public class QABoardDAO {

	private Properties prop = new Properties();
	
	public QABoardDAO() {
		
		String filePath = QABoardDAO.class.getResource("/sql/qaBoard/qaBoard-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		// getListCount=SELECT COUNT(*) FROM QNA WHERE STATUS='Y' 
		
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset); // import static 해줘야 빨간 줄 안 뜸
			close(stmt);
		}
		
		return result;
	}

	public ArrayList<QABoard> selectList(Connection conn, PageInfo pi, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<QABoard> list = null;
		
		String query = prop.getProperty("selectList");
		// selectList=SELECT * FROM QNALIST WHERE RNUM BETWEEN ? AND ? AND USER_NO = ?
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; 
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, userNo);

			rset = pstmt.executeQuery();
			list = new ArrayList<QABoard>();
			
			while(rset.next()) {
				QABoard b = new QABoard(rset.getInt("QA_NO"),
										rset.getString("QA_TITLE"),
										rset.getString("QA_CONTENT"),
										rset.getDate("QA_QUESTION_DATE"),
										rset.getString("QA_ANSWER"),
										rset.getDate("QA_ANSWER_DATE"),
										rset.getInt("USER_NO"),
										rset.getString("USER_NAME"),
										rset.getInt("QACATE_NO"),
										rset.getString("QACATE_NAME"),
										rset.getString("STATUS"));
				// QA_NO, QA_TITLE, QA_CONTENT, QA_QUESTION_DATE, QA_ANSWER, QA_ANSWER_DATE, USER_NO, USER_NAME, QACATE_NO, QACATE_NAME, Q.STATUS
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public QABoard selectBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QABoard b = null;
		
		String query = prop.getProperty("selectBoard");
		// selectBoard=SELECT * FROM BDETAIL WHERE BOARD_ID=?

		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new QABoard(rset.getInt("QA_NO"),						
								rset.getString("QA_TITLE"),
								rset.getString("QA_CONTENT"),
								rset.getDate("QA_QUESTION_DATE"),
								rset.getString("QA_ANSWER"),							
								rset.getDate("QA_ANSWER_DATE"),							
								rset.getInt("USER_NO"),
								rset.getString("USER_NAME"),
								rset.getInt("QACATE_NO"),
								rset.getString("QACATE_NAME"),
								rset.getString("STATUS"));
								
				// QA_NO, QA_TITLE, QA_CONTENT, QA_QUESTION_DATE, QA_ANSWER, QA_ANSWER_DATE, USER_NO, USER_NAME, QACATE_NO, QACATE_NAME, Q.STATUS
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;

	}

	public int insertBoard(Connection conn, QABoard b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		// insertBoard=INSERT INTO QNA VALUES(qna_seq.NEXTVAL, ?, ?, DEFAULT, NULL, NULL, ?, ?, 'Y')
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, b.getQaTitle());
			pstmt.setString(2, b.getQaContent());
			pstmt.setInt(3, b.getUserNo());
			pstmt.setInt(4, b.getQacateNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertFile(Connection conn, ArrayList<QAFile> fileList) {
        PreparedStatement pstmt = null;
        int result = 0;
 
        String query = prop.getProperty("insertFile");
        // insertFile=INSERT INTO ADDFILE VALUES(addfile_seq.nextval, ?, ?, ?, sysdate, 'n', null, null, qna_seq.CURRVAL)
        
        try {
        	for(int i = 0; i < fileList.size(); i++) {
				QAFile qaf = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, qaf.getFileName());
				pstmt.setString(2, qaf.getFileChangeName());
				pstmt.setString(3, qaf.getFilePath());
				
				result += pstmt.executeUpdate();

        	}
        } catch (SQLException e) {
        	e.printStackTrace();
        } finally {
        	close(pstmt);
        } 
        return result;
	}
	
	public ArrayList<QAFile> selectFile(Connection conn, int bId){
        
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<QAFile> fileList = new ArrayList<QAFile>();
 
        String query = prop.getProperty("selectFile");
        // selectFile=SELECT * FROM ADDFILE WHERE QA_NO=? 
        
        try {
            pstmt = conn.prepareStatement(query);
 
            pstmt.setInt(1, bId);
            rset = pstmt.executeQuery();
            
            
            fileList = new ArrayList<QAFile>();
            
            while(rset.next()) {
				QAFile qaf = new QAFile();
				qaf.setFileNo(rset.getInt("F_NO"));;
				qaf.setFileName(rset.getString("F_NAME"));
				qaf.setFileChangeName(rset.getString("CHANGE_NAME"));
				qaf.setFilePath(rset.getString("FILE_PATH"));
				
				fileList.add(qaf);

            }
            
 
        } catch (SQLException e) {
        	e.printStackTrace();
        } finally {
        	close(rset);
        	close(pstmt);
        }
        return fileList;
    }



	public int updateBoard(Connection conn, QABoard b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBoard");
		// updateBoard=UPDATE QNA SET QACATE_NO=?, QA_TITLE=?, QA_CONTENT=? WHERE QA_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, b.getQacateNo());
			pstmt.setString(2, b.getQaTitle());
			pstmt.setString(3, b.getQaContent());
			pstmt.setInt(4, b.getQaNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}

	public int deleteBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBoard");
		// deleteBoard=UPDATE QNA SET STATUS='N' WHERE QA_NO=?
		
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

	

	

	


	

}
