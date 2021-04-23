package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.MemberService;
import member.model.vo.Order;

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
		String input = request.getParameter("inputSearch");
		ArrayList<Order> list = null;

		MemberService mService = new MemberService();
		if (input == null || input.equals(""))
			list = mService.orderList();
		else
			list = mService.searchOrder(filter, input);
		
		if (list != null && list.size() > 0) {
			for (Order o : list) {
				String[] products = o.getpList().split("&&");
				if (products.length > 1)
					o.setpList(products[0] + " 외 " + (products.length - 1));
			}
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
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
