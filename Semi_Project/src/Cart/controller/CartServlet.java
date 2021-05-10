package Cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Cart.model.service.CartService;
import Cart.model.vo.Cart;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class CartFromServlet
 */
@WebServlet("/goCart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int userNo = loginUser.getUserNo();
		
		Member member = new MemberService().selectMember(userId);
		
		System.out.println(member);
		
		ArrayList<Cart> cartlist = new CartService().selectList(userNo); 
		
		String page = null;
		if(cartlist != null) {
			page = "WEB-INF/views/cart/cartView.jsp";
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("userId", member);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 조회에 실패하였습니다.");
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
