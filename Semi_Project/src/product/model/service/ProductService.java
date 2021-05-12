package product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import product.model.dao.ProductDAO;
import common.PageInfo;
import product.model.vo.Product;
import product.model.vo.ProductFile;

public class ProductService {
	
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

	public int listCount(String cate) {
		Connection conn = getConnection();

		int result = new ProductDAO().listCount(conn, cate);

		close(conn);

		return result;
	}

	public ArrayList<Product> productList(PageInfo pi, String cate) {
		Connection conn = getConnection();

		ArrayList<Product> list = new ProductDAO().productList(conn, pi, cate);

		close(conn);

		return list;
	}

	public ArrayList<Product> allProductList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Product> list = new ProductDAO().allProductList(conn, pi);

		close(conn);

		return list;
	}
}
