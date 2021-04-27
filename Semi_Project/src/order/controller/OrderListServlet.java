package order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PageInfo;
import common.PagingTemplate;
import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/orderList.do")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderListServlet() {
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
		
		OrderService oService = new OrderService();
		int listCount = oService.listCount("",null);
		PageInfo pi = new PagingTemplate().getPageInfo(page,listCount);

		ArrayList<Order> list = oService.orderList(pi);
	
		if (list != null && list.size() > 0) {
			for (Order o : list) {
				String[] products = o.getpList().split("&&");
				if (products.length > 1)
					o.setpList(products[0] + " 외 " + (products.length - 1)+"");
			}
		}
		
		request.setAttribute("page",pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/admin/member/orderList.jsp").forward(request, response);
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
