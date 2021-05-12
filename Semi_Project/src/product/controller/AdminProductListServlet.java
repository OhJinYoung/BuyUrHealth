package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PageInfo;
import common.PagingTemplate;
import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class AdminProductListServlet
 */
@WebServlet("/productList.do")
public class AdminProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminProductListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		ProductService pService = new ProductService();

		int listCount = pService.listCount("");

		PageInfo pi = new PagingTemplate().getPageInfo(page, listCount);

		ArrayList<Product> list = pService.allProductList(pi);

		request.setAttribute("page", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/admin/product/productList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
