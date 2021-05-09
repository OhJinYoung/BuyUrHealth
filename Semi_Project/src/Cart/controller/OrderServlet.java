package Cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Cart.model.service.UserOrderService;
import Cart.model.vo.Cart;
import member.model.vo.Member;
import order.model.vo.Order;
import order.model.vo.OrderDetail;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order.or")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();

		
		String orNo = request.getParameter("orderNo").trim();
		int orderNo = Integer.parseInt(orNo);
		
		String name = request.getParameter("Username").trim();
		
		String address = request.getParameter("address");
		address = address.replace("\r\n", "<br>");
		
		String phone = request.getParameter("phone").trim();
		String email = request.getParameter("email").trim();
		String payment = request.getParameter("payment").trim();
		
		String forrequest = "";
		if(request.getParameter("forrequest") == "") {
			forrequest += "요청사항이 없습니다.";
		} else {
			forrequest = request.getParameter("forrequest");
		}
		
		int price = Integer.parseInt(request.getParameter("price"));
		
		
		Order o = new Order();
		o.setName(name);
		o.setAddress(address);
		o.setPhone(phone);
		o.setEmail(email);
		o.setRequest(forrequest);
		o.setUserNo(userNo);
		o.setPrice(price);
		o.setNo(orderNo);
		
		
		int result = new UserOrderService().insertOrderInfo(o);
		
		if(result > 0) {
			request.getRequestDispatcher("insertDetail").forward(request, response);
			request.setAttribute("o", o);
		} else {
			request.setAttribute("msg", "정보를 처리하는데 문제가 발생했습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
