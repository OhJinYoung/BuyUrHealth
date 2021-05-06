package Cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import Cart.model.service.UserOrderService;
import Cart.model.vo.UserOrder;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/pay.or")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		
		String status = request.getParameter("state"); 
		String payments = request.getParameter("payment");
		
		/*
		 * String imp_uid = request.getParameter("imp_uid"); //post ajax request로부터
		 * imp_uid확인
		 */
		
		
		String state = "";
		if(status.equals("paid")) {
			state = "결제완료";
		} else {
			state = "결제미완료";
		}
		
		String payment = "";
		if(payments.equals("point")) {
			payment = "카드";
		} else {
			payment = "-";
		}
		
		UserOrder o = new UserOrder();
		o.setPayment(payment);
		o.setState(state);
		o.setNo(orderNo);;
		
		int result = 0;
		
		if(result > 0) {
			request.getRequestDispatcher("WEB-INF/views/cart/orderCompleteView.jsp").forward(request, response);
			/*
			 * request.getRequestDispatcher("WEB-INF/views/cart/orderCompleteView.jsp").
			 * forward(request, response); request.setAttribute("o", o);
			 */
		} else {
			request.setAttribute("msg", "결제에 실패했습니다.");
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
