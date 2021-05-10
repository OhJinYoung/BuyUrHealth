package order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.PageInfo;
import common.PagingTemplate;
import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class SearchOrderServlet
 */
@WebServlet("/searchOrder.do")
public class SearchOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchOrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filter = request.getParameter("filter");
		String input = request.getParameter("input");
		String page = request.getParameter("page");

		OrderService oService = new OrderService();
		int listCount = oService.listCount(filter, input);
		PageInfo pi = new PagingTemplate().getPageInfo(page, listCount);

		ArrayList<Order> list = null;
		list = oService.searchOrder(filter, input, pi);

		request.setAttribute("input", input);
		request.setAttribute("filter", filter);
		request.setAttribute("page", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/admin/member/orderList.jsp")
				.forward(request, response);
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
