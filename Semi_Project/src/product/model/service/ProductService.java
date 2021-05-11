package product.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import product.model.dao.ProductDAO;
import product.model.vo.PageInfo;
import product.model.vo.Product;
import product.model.vo.ProductFile;

public class ProductService {

	public int getlistCount1() {
		Connection conn = getConnection();

		int listCount = new ProductDAO().getListCount1(conn);

		close(conn);

		return listCount;
	}
	
	public int getlistCount2() {
		Connection conn = getConnection();

		int listCount = new ProductDAO().getListCount2(conn);

		close(conn);

		return listCount;
	}
	
	public int getlistCount3() {
		Connection conn = getConnection();

		int listCount = new ProductDAO().getListCount3(conn);

		close(conn);

		return listCount;
	}
	
	public int getlistCount4() {
		Connection conn = getConnection();

		int listCount = new ProductDAO().getListCount4(conn);

		close(conn);

		return listCount;
	}
	
	public int getlistCount5() {
		Connection conn = getConnection();

		int listCount = new ProductDAO().getListCount5(conn);

		close(conn);

		return listCount;
	}
	
	public int getlistCount6() {
		Connection conn = getConnection();

		int listCount = new ProductDAO().getListCount6(conn);

		close(conn);

		return listCount;
	}
	
	public int getlistCount7() {
		Connection conn = getConnection();

		int listCount = new ProductDAO().getListCount7(conn);

		close(conn);

		return listCount;
	}


	
	public ArrayList selectTList(PageInfo pi, int i, int pcategory) {
		Connection conn = getConnection();

		ArrayList list = null;

		ProductDAO pDAO = new ProductDAO();
		if (i == 1) {
			list = pDAO.selectPList(conn, pi, pcategory);
		} else {
			list = pDAO.selectFList(conn);
		}

		return list;
	}
	

	public int insertProduct(Product p, ArrayList<ProductFile> fileList) {
		Connection conn = getConnection();

		ProductDAO dao = new ProductDAO();

		int result1 = dao.insertProduct(conn, p);
		int result2 = dao.insertProductFile(conn, fileList);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result1;
	}

	public Product selectProduct(int pNo) {
		Connection conn = getConnection();
		
		ProductDAO dao = new ProductDAO();
		
		Product product = dao.selectProduct(conn, pNo);
			if(product != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
		return product;
	}
	
	public ProductFile selectProductFile(int productNo) {
		Connection conn = getConnection();
		
		ProductDAO dao = new ProductDAO();
		
		ProductFile productFile = dao.selectProductFile(conn, productNo);
		if(productFile != null) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return productFile;
	}


	public ArrayList<ProductFile> selectProductFiles(int pNo) {
		Connection conn = getConnection();
		
		ArrayList<ProductFile> list = new ProductDAO().selectProductFiles(conn, pNo);
		
		return list;
	}

	public int updateProduct(Product p, ArrayList<ProductFile> fileList) {
		Connection conn = getConnection();

		ProductDAO dao = new ProductDAO();

		int result1 = dao.updateProduct(conn, p);
		int result2 = dao.updateProductFile(conn, fileList);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result1;
	}

	public int deleteProduct(int no) {
		Connection conn = getConnection();
		
		int result = new ProductDAO().deleteProduct(conn, no);
		
		if(result > 0) {
			commit(conn); 
		} else {
			rollback(conn);
		}
		
		return result;
	}


}
