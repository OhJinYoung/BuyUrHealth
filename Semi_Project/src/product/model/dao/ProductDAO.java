package product.model.dao;

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

import product.model.vo.PageInfo;
import product.model.vo.Product;
import product.model.vo.ProductFile;

public class ProductDAO {
	private Properties prop = new Properties();
	
	public ProductDAO() {
		String filePath = ProductDAO.class.getResource("/sql/product/product-query.properties").getPath();
		
			try {
				prop.load(new FileReader(filePath));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	//제품 카테고리별로 카운팅
	public int getListCount1(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount1");
		// getListCount1=SELECT COUNT(*) FROM PRODUCT WHERE CATE_NO = 1
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
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
	
	public int getListCount2(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount2");
		// getListCount2=SELECT COUNT(*) FROM PRODUCT WHERE CATE_NO = 2
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
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
	
	public int getListCount3(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount3");
		// getListCount3=SELECT COUNT(*) FROM PRODUCT WHERE CATE_NO = 3

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
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
	
	public int getListCount4(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount4");
		// getListCount4=SELECT COUNT(*) FROM PRODUCT WHERE CATE_NO = 4
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
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
	
	public int getListCount5(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount5");
		// getListCount5=SELECT COUNT(*) FROM PRODUCT WHERE CATE_NO = 5
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
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
	
	public int getListCount6(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount6");
		// getListCount6=SELECT COUNT(*) FROM PRODUCT WHERE CATE_NO = 6
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
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
	
	public int getListCount7(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount7");
		// getListCount7=SELECT COUNT(*) FROM PRODUCT WHERE CATE_NO = 7
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
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
	
	public ArrayList selectPList(Connection conn, PageInfo pi, int pcategory) { 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectPList");
		//SELECT * FROM ( SELECT ROWNUM RRNUM, P.* FROM(SELECT * FROM PLIST WHERE CATE_NO=? ORDER BY PRODUCT_NO DESC) P ) WHERE RRNUM BETWEEN ? AND ?
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; 
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pcategory);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Product>();
			while(rset.next()) {
				Product pro = new Product(rset.getInt("PRODUCT_NO"),
										  rset.getString("PRODUCT_NAME"),
										  rset.getInt("CATE_NO"),
										  rset.getInt("PRODUCT_VOLUME"),
										  rset.getString("PRODUCT_DETAIL"),
										  rset.getInt("PRODUCT_PRICE"));
								list.add(pro);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		/* 
			PLIST VIEW 생성 
			
			
			CREATE OR REPLACE VIEW PLIST
			AS
			SELECT ROWNUM RNUM, DESCPRODUCT.*
			FROM (SELECT PRODUCT_NO, PRODUCT_NAME, CATE_NO, PRODUCT_VOLUME, PRODUCT_DETAIL, PRODUCT_PRICE 
			        FROM PRODUCT P
			            JOIN PCATEGORY USING(CATE_NO)
			        ORDER BY PRODUCT_NO DESC) DESCPRODUCT;
		 
		 */
	}

	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ProductFile> list = null;
		
		String query = prop.getProperty("selectFList");
		// selectFList=SELECT * FROM ADDFILE WHERE F_YN ='Y'

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<ProductFile>();
			while(rset.next()) {
				list.add(new ProductFile( 
						rset.getInt("PRODUCT_NO"),
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
	
	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProduct");
		// insertProduct=INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, ?, ? ,? ,?, ?)
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getProductName());
			pstmt.setInt(2, p.getProductVolume());
			pstmt.setString(3, p.getProductDetail());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setInt(5, p.getCategoryNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertProductFile(Connection conn, ArrayList<ProductFile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProductFile");
		// INSERT INTO ADDFILE VALUES(ADDFILE_SEQ.NEXTVAL,?, ?, ?, SYSDATE,?, NULL, PRODUCT_SEQ.CURRVAL, NULL)
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				ProductFile pt = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, pt.getFileName());
				pstmt.setString(2, pt.getChangeName());
				pstmt.setString(3, pt.getFilePath());
				pstmt.setString(4, pt.getFileYN());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(pstmt);
		}
		return result;
	}

	public Product selectProduct(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = prop.getProperty("selectProduct");
		// SELECT * FROM PLIST WHERE PRODUCT_NO = ?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(rset.getInt("PRODUCT_NO"),
						  rset.getString("PRODUCT_NAME"),
						  rset.getInt("CATE_NO"),
						  rset.getInt("PRODUCT_VOLUME"),
						  rset.getString("PRODUCT_DETAIL"),
						  rset.getInt("PRODUCT_PRICE"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}

	public ArrayList<ProductFile> selectProductFiles(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductFile> list = null;
		
		String query = prop.getProperty("selectProductFile");
		// SELECT * FROM ADDFILE WHERE PRODUCT_NO = ? ORDER BY F_NO 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ProductFile>();
			
			while(rset.next()) {
				ProductFile pt = new ProductFile();
				pt.setFileNo(rset.getInt("F_NO"));
				pt.setFileName(rset.getString("F_NAME"));
				pt.setChangeName(rset.getString("CHANGE_NAME"));
				pt.setFilePath(rset.getString("FILE_PATH"));
				pt.setUploadDate(rset.getDate("UPLOAD_DATE"));
				
				list.add(pt);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ProductFile selectProductFile(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ProductFile productFile = null;

		String query = prop.getProperty("selectProductFile");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productNo);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				productFile = new ProductFile(rset.getInt("F_NO"),
						  					  rset.getString("F_NAME"),
						  					  rset.getInt("PRODUCT_NO"),
						  					  rset.getString("CHANGE_NAME"),
						  					  rset.getString("FILE_PATH"),
						  					  rset.getDate("UPLOAD_DATE"));

			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return productFile;
	}

	public int updateProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProduct");
		// updateProduct=UPDATE PRODUCT SET PRODUCT_NAME=?, PRODUCT_VLOUME=?, PRODUCT_DETAIL=?, PRODUCT_PRICE=?, CATE_NO=?

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getProductName());
			pstmt.setInt(2, p.getProductVolume());
			pstmt.setString(3, p.getProductDetail());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setInt(5, p.getCategoryNo());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateProductFile(Connection conn, ArrayList<ProductFile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProductFile");
		// updateProductFile=INSERT INTO ADDFILE VALUES(ADDFILE_SEQ.NEXTVAL,?, ?, ?, SYSDATE,?, NULL, PRODUCT_SEQ.CURRVAL, NULL)

		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				ProductFile pt = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, pt.getFileName());
				pstmt.setString(2, pt.getChangeName());
				pstmt.setString(3, pt.getFilePath());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(pstmt);
		}
		return result;
	}

	public int deleteProduct(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteProduct");	
		
		// FK_PRODUCT_TO_ADDFILE_1제약조건 삭제 후 
		
		//ALTER TABLE "BUH"."ADDFILE" ADD CONSTRAINT "FK_PRODUCT_TO_ADDFILE_1" FOREIGN KEY ("PRODUCT_NO")
		// REFERENCES "BUH"."PRODUCT" ("PRODUCT_NO") ON DELETE CASCADE;
		// 실행해주었음.
		
		// deleteProduct=DELETE PRODUCT WHERE PRODUCT_NO = ?
		
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
