package member.controller;

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
 * Servlet implementation class AddCartMypageServlet
 */
@WebServlet("/addCartMypage")
public class AddCartMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		Cart c = new Cart();
		c.setUserNo(userNo);
		c.setProductNo(pNo);
		c.setCartVolume(1);
		
		int result = new CartService().insertCart(c);
		
		if(result > 0) {
			response.sendRedirect("goCart");
		} else {
			request.setAttribute("msg", "찜 목록 조회에 실패하였습니다.");
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
