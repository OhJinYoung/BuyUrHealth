package Cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Cart.model.service.CartService;
import Cart.model.vo.Cart;
import member.model.vo.Member;

/**
 * Servlet implementation class GetCartServlet
 */
@WebServlet("/getcart")
public class GetCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		int proNo = Integer.parseInt(request.getParameter("productNo").trim());
		String proName = request.getParameter("productName");
		int proVol = Integer.parseInt(request.getParameter("number").trim());
		int proPrice = Integer.parseInt(request.getParameter("total").trim());
		int cartNo = Integer.parseInt(request.getParameter("cartNo").trim());
		int cartPrice = proPrice * cartNo;
		
		
		Cart c = new Cart();
		c.setProductName(proName); // product에서 받아오기
		c.setProductVolume(proVol);
		c.setCartVolume(1);
		c.setProductPrice(proPrice); // product에서 받아오기
		c.setUserNo(userNo);
		c.setProductNo(proNo);
		c.setCartPrice(cartPrice);
		
		int result = new CartService().insertCart(c);
		
		
		if(result > 0) {
			request.getRequestDispatcher("WEB-INF/views/cart/cartView.jsp").forward(request, response);
			request.setAttribute("c", c);
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
