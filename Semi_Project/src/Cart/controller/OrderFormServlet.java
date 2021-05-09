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
			request.setAttribute("msg", "공지사항 조회에 실패하였습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);

		
		/*// proName(상품명)
        String[] proName = request.getParameterValues("proName");
        
        
        // proPrice(상품가격)
        String[] pPrice = request.getParameterValues("proPrice");
        int[] proPrice = new int[pPrice.length];
        for(int i=0; i<pPrice.length; i++) {
        	proPrice[i] = Integer.parseInt(pPrice[i]);
        }
        
        // proNo(상품번호)
        String[] pNo = request.getParameterValues("proNo");
        int[] proNo = new int[pNo.length];
        for(int i=0; i<pNo.length; i++) {
        	proNo[i] = Integer.parseInt(pNo[i]);
        }
        
        // cartVol(장바구니 수량)
        String[] cVol = request.getParameterValues("cartVol");
        int[] cartVol = new int[cVol.length];
        for(int i=0; i<cVol.length; i++) {
        	cartVol[i] = Integer.parseInt(cVol[i]);
        }
        
        // cartPrice(수량*상품가격)
        String[] cPrice = request.getParameterValues("cartPrice");
        int[] cartPrice = new int[cPrice.length];
        for(int i=0; i<cPrice.length; i++) {
        	cartPrice[i] = Integer.parseInt(cPrice[i]);
        }

        
        ArrayList<OrderDetail> od = new ArrayList<OrderDetail>();
        for(int i = 1; ; i++) {
        	od.add(new OrderDetail(0, cartVol[i], proNo[i], 0, proName[i], proPrice[i]));
        }
        OrderDetail OrderDetail = null;
		for(int i = 0; i < od.size(); i++) {
			OrderDetail += od.get(i);
		}

        System.out.println(od);
        
        String page = null;
		if(od != null) {
			page = "WEB-INF/views/cart/orderView_Payment.jsp";
			request.setAttribute("od", od);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회에 실패하였습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
