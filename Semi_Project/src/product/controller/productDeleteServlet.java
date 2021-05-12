package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import product.model.service.ProductService;

/**
 * Servlet implementation class productDeleteServlet
 */
@WebServlet("/delete.pro")
public class productDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public productDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));

		int result = new ProductService().deleteProduct(no);

		String msg = "";
		if (result > 0) {
				response.sendRedirect("productList.do");
		} else {
			msg = "제품 삭제 중 오류가 발생했습니다.";
		}

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(msg, response.getWriter());
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
