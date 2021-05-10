package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import order.model.service.OrderService;
import order.model.vo.Order;
import order.model.vo.OrderDetail;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductFile;

/**
 * Servlet implementation class DetailMyProductFormServlet
 */
@WebServlet("/detailMyProductForm.me")
public class DetailMyProductFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailMyProductFormServlet() {
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
		String id = loginUser.getUserId();
		
		Product product = null;
		ProductFile productFile = null;
		OrderDetail orderDetail = null;
		
		Member member = new MemberService().selectMember(id);
		Order orderList = new OrderService().searchMypageOrderNormal(member.getUserNo());
		orderDetail = new OrderService().selectMypageOrderDetail(orderList.getNo());
		product = new ProductService().selectProduct(orderDetail.getProductNo());
		productFile = new ProductService().selectProductFile(product.getProductNo()); 
		
		
//		int userNo = member.getUserNo();
		
		String page = null;
		if(productFile != null) {
			page = "WEB-INF/views/member/buyMyProduct.jsp";
			request.setAttribute("userId", member);
			request.setAttribute("orderList", orderList);
			request.setAttribute("orderDetail", orderDetail);
			request.setAttribute("product", product);
			request.setAttribute("productFile", productFile);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "구매목록 조회에 실패하였습니다.");
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
