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
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		
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

	/*
	public ArrayList<Product> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; 
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
		 
	}
		*/


	public ArrayList selectPList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectPList");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; 
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	}

	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ProductFile> list = null;
		
		String query = prop.getProperty("selectFList");

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

	public int insertProductFile(Connection conn, ArrayList<ProductFile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProductFile");
		
		
		
		
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

	public Product selectProduct(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = prop.getProperty("selectProduct");
		
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
	
	/*
	public ArrayList<Product> selectList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Product pro = new Product(
								   rset.getInt("PRODUCT_NO"),
								   rset.getString("PRODUCT_NAME"),
								   rset.getInt("PRODUCT_VOLUME"),
								   rset.getString("PRODUCT_DETAIL"),
								   rset.getString(""),
								   rset.getString(""),
								   rset.getInt("PRODUCT_PRICE")
								   rset.getInt("CATE_NO"));	
				
				list.add(pro);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	*/



}
