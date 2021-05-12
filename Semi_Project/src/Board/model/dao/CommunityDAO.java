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
import QABoard.model.vo.QAFile;

public class CommunityDAO {

	private Properties prop = new Properties();
	
	public CommunityDAO() {
		String filePath = CommunityDAO.class.getResource("/sql/community/community-query.properties").getPath(); // 경로가져옴
		
		try {
			prop.load(new FileReader(filePath)); 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public int insertCommunity(Connection conn, Community c) {  // 게시판 생성
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCommunity");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getCommTitle());
			pstmt.setString(2, c.getCommContent());
//			pstmt.setInt(3, c.getUserNo());   
//			pstmt.setInt(3, c.getCtgNo());
			pstmt.setDate(3, c.getCommDate());
			pstmt.setString(4, c.getUserName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList selectcList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Community> list = null;
		
		String query = prop.getProperty("selectcList");
	
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Community>(); 
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
		
		String query = prop.getProperty("insertAddFile");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				AddFile af = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, af.getfName());
				pstmt.setString(2, af.getChangeName());
				pstmt.setString(3, af.getFilePath());
				pstmt.setString(4, af.getfYN());  
//				pstmt.setInt(5, af.getCommNo()); 
				 
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public Community selectCommunity(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Community c = null;
		
		String query = prop.getProperty("selectCommunity");
//selectBoard=SELECT * FROM BDETAIL WHERE BOARD_ID = ?

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Community(rset.getInt("COMM_NO"),
								rset.getString("COMM_TITLE"), 
								rset.getString("COMM_CONTENT"),
								rset.getDate("COMM_DATE"),
								rset.getInt("USER_NO"),
								rset.getInt("CTG_NO"),
								rset.getString("USER_NAME"),
								rset.getInt("CO_NO"),
								rset.getString("CO_CONTENT")); 
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
				af.setfNo(rset.getInt("F_NO"));
				af.setfName(rset.getString("F_NAME"));
				af.setChangeName(rset.getString("CHANGE_NAME"));
				af.setFilePath(rset.getString("FILE_PATH"));  // 내용수정
				
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


	public int updateCommunity(Connection conn, Community c) {  // 0510 입력 내용
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getCommTitle());
			pstmt.setString(2, c.getCommContent());
//			pstmt.setInt(3, c.getUserNo());   
			pstmt.setInt(3, c.getCtgNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}


	public int deleteCommunity(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCommunity");
		
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


	public ArrayList<AddFile> selectFile(Connection conn, int bId) {  //0511
        
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<AddFile> fileList = new ArrayList<AddFile>();
 
        String query = prop.getProperty("selectFile");
        
        try {
            pstmt = conn.prepareStatement(query);
 
            pstmt.setInt(1, bId);
            rset = pstmt.executeQuery();
            
            
            fileList = new ArrayList<AddFile>();
            
            while(rset.next()) {
				AddFile af = new AddFile();
				af.setfNo(rset.getInt("F_NO"));;
				af.setfName(rset.getString("F_NAME"));
				af.setChangeName(rset.getString("CHANGE_NAME"));
				af.setFilePath(rset.getString("FILE_PATH"));
				
				fileList.add(af);

            }
            
 
        } catch (SQLException e) {
        	e.printStackTrace();
        } finally {
        	close(rset);
        	close(pstmt);
        }
        return fileList;
    }


}	
