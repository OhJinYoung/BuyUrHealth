package Cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Cart.model.service.CartService;

import member.model.vo.Member;
import Cart.model.service.OrderService;
import Cart.model.vo.Order;

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
		
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		String name = request.getParameter("name");
		String address = request.getParameter("postcode") + request.getParameter("roadAddress") + request.getParameter("detailAddress") + request.getParameter("sample4_extraAddress");
		address = address.replace("\r\n", "<br>");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String forrequest = request.getParameter("forrequest");
		int price = Integer.parseInt(request.getParameter("i_priceTotal"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Order o = new Order();
		o.setName(name);
		o.setAddress(address);
		o.setPhone(phone);
		o.setEmail(email);
		o.setRequest(forrequest);
		o.setUserNo(userNo);
		o.setPrice(price);
		o.setOrderNo(orderNo);
		
		
		int result = new OrderService().insertOrderInfo(o);
		request.setAttribute("order", o);
		request.setAttribute("orderNo", orderNo);
		request.setAttribute("name", name);
		request.setAttribute("address", address);
		request.setAttribute("phone", phone);
		request.setAttribute("email", email);
		
		if(result > 0) {
			request.getRequestDispatcher("WEB-INF/views/cart/payView.jsp").forward(request, response);
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
