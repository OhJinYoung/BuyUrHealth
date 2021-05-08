package Cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Cart.model.service.CartService;
import Cart.model.service.UserOrderService;
import order.model.vo.Order;


/**
 * Servlet implementation class OrderCompleteServlet
 */
@WebServlet("/com.or")
public class OrderCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("welcome to OrderCompleteServlet");
		
		int oNo = Integer.parseInt(request.getParameter("orderNo"));
		System.out.println("oNo받음");
		
		Order order = new UserOrderService().detailOrder(oNo);
		System.out.println("detailOrder에 넘김");
		
		String page = null;
		if(order != null) {
			page = "WEB-INF/views/cart/orderCompleteView.jsp";
			request.setAttribute("order", order);
			System.out.println("com.or -> orderCompleteView");
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "주문접수에 실패했습니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
