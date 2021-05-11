package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import order.model.vo.RequestOrder;

/**
 * Servlet implementation class ProductReturn
 */
@WebServlet("/ProductReturn")
public class ProductReturn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductReturn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestSelect = request.getParameter("requestSelect");
		String requestResult = request.getParameter("requestResult");
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getUserId();
		
		Member member = new MemberService().selectMember(id);
		Order order= new OrderService().searchMypageOrderNormal(member.getUserNo());
		
		RequestOrder ro = new RequestOrder();
		ro.setType(requestSelect);
		ro.setInfo(requestResult);
		
		int updateRequest = new OrderService().insertRequest(order.getNo(), ro);
		
		System.out.println(updateRequest);
		
		String page = null;
		if(updateRequest > 0) {
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('요청이 처리되었습니다.');</script>");
			response.sendRedirect("buyMyPage.me");
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "요청처리에 실패하였습니다.");
			request.getRequestDispatcher(page).forward(request, response);
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
