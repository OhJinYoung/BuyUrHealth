package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductFile;

/**
 * Servlet implementation class productUpdateServlet
 */
@WebServlet("/productUpdateForm.pro")
public class productUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			String productName = request.getParameter("name");
			int categoryNo = Integer.parseInt(request.getParameter("pcategoryNo"));
			int productVolume = Integer.parseInt(request.getParameter("number"));
			int productPrice = Integer.parseInt(request.getParameter("total"));
			String productDetail = request.getParameter("detail");

			Product p = new Product(productNo, productName, categoryNo, productVolume, productDetail, productPrice);
			
			request.setAttribute("p", p);
			request.getRequestDispatcher("WEB-INF/views/product/prodChange.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
