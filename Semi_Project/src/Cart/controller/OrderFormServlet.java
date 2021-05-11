package Cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Cart.model.service.CartService;
import Cart.model.service.UserOrderService;
import Cart.model.vo.Cart;
import member.model.vo.Member;
import order.model.vo.Order;
import order.model.vo.OrderDetail;

/**
 * Servlet implementation class OrderFormServlet
 */
@WebServlet("/orderPage")
public class OrderFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int userNo = loginUser.getUserNo();
		
		ArrayList<Cart> cart = new CartService().selectList(userNo); 
		
		String page = null;
		if(cart != null) {
			page = "WEB-INF/views/cart/orderView_Payment.jsp";
			request.setAttribute("cartlist", cart);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "정보를 처리하는데 실패하였습니다.");
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
