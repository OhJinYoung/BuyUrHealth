package product.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import product.model.dao.ProductDAO;
import product.model.vo.PageInfo;
import product.model.vo.Product;
import product.model.vo.ProductFile;

public class ProductService {

	public int getlistCount() {
		Connection conn = getConnection();

		int listCount = new ProductDAO().getListCount(conn);

		close(conn);

		return listCount;
	}

	/* public ArrayList<Product> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Product> list = new ProductDAO().selectList(conn, pi);

		close(conn);

		return list;
	}
	
	*/

	public ArrayList selectTList(PageInfo pi, int i) {
		Connection conn = getConnection();

		ArrayList list = null;

		ProductDAO pDAO = new ProductDAO();
		if (i == 1) {
			list = pDAO.selectPList(conn, pi);
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

}
