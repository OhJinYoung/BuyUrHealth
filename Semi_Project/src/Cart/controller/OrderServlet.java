package Cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Cart.model.service.CartService;

import member.model.vo.Member;
import Cart.model.service.UserOrderService;
import order.model.vo.Order;

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
		
		String orNo = request.getParameter("orderNo").trim();
		System.out.println("기존주문번호 : " + orNo);
		int orderNo = Integer.parseInt(orNo);
		System.out.println("변환주문번호 : " + orderNo);
		
		String name = request.getParameter("Username").trim();
		System.out.println("주문자 : " + name);
		
		String address = request.getParameter("address");
		address = address.replace("\r\n", "<br>");
		System.out.println("주소 : " + address);
		
		String phone = request.getParameter("phone").trim();
		System.out.println("핸드폰번호 : " + address);
		
		String email = request.getParameter("email").trim();
		System.out.println("이메일 : " + email);
		
		String payment = request.getParameter("payment").trim();
		System.out.println("결제 수단 : " + payment);
		
		String forrequest = "";
		if(request.getParameter("forrequest") == "") {
			forrequest += "요청사항이 없습니다.";
		} else {
			forrequest = request.getParameter("forrequest");
		}
		System.out.println("요청사항 : " + forrequest);
		
		int price = Integer.parseInt(request.getParameter("price"));
		System.out.println("가격 : " + price);
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		System.out.println("유저번호 : " + userNo);
		
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
			request.getRequestDispatcher("WEB-INF/views/cart/orderCompleteView.jsp").forward(request, response);
			request.setAttribute("order", o);
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
