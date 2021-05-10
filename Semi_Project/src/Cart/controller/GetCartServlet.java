package Cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Cart.model.service.CartService;
import Cart.model.vo.Cart;
import member.model.vo.Member;
import product.model.vo.ProductFile;

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
		int proPrice = Integer.parseInt(request.getParameter("total").trim()); // 제품번호
		int cartVolume = Integer.parseInt(request.getParameter("number").trim()); // 제품번호
		
		System.out.println(userNo);
		System.out.println(proNo);
		System.out.println(proPrice);
		
		
		Cart c =  new Cart(cartVolume, userNo, proNo);
		System.out.println(c);
		
		// 같은상품이면 수량만 추가해야함. 아직못함 
//		response.setContentType("text/html; charset=UTF-8"); 
//		for(int i = 0; i < cartlist.size(); i++) {
//			if(cartlist.get(i).getProductNo() == proNo) {
//				PrintWriter writer = response.getWriter(); 
//				writer.println("<script>alert('이미 장바구니에 추가된 상품입니다.'); location.href='<%= request.getContextPath() %>/goCart';</script>"); 
//				writer.close();
//			}
//		}
		
		int result = new CartService().insertCart(c);
		ArrayList<Cart> cartlist =  new CartService().selectList(userNo); 
		System.out.println(cartlist);
		
		
		ArrayList<ProductFile> fList = new CartService().selectTList(1);
		System.out.println(fList);
		
		
		String page = null;
		if(result > 0 && fList != null) {
			page = "WEB-INF/views/cart/cartView.jsp";
			request.setAttribute("c", c);
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("fList",  fList);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "정보를 처리하는데 문제가 발생했습니다.");
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