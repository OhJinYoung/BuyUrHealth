package Cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
		request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		int proNo = Integer.parseInt(request.getParameter("productNo").trim()); // 제품번호
		
		Cart c = new Cart();
		c.setCartVolume(1);
		c.setUserNo(userNo);
		c.setProductNo(proNo); // product에서 받아오기
		
		ArrayList<Cart> cartlist = (ArrayList<Cart>)request.getAttribute("cartlist");
		
		// 되는지 실행해보기
		response.setContentType("text/html; charset=UTF-8"); 
		for(int i = 0; i < cartlist.size(); i++) {
			if(cartlist.get(i).getProductNo() == proNo) {
				PrintWriter writer = response.getWriter(); 
				writer.println("<script>alert('이미 장바구니에 추가된 상품입니다.'); location.href='<%= request.getContextPath() %>/goCart';</script>"); 
				writer.close();
			}
		}
		
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
