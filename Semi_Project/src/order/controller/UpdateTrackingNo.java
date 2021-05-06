package order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import order.model.service.OrderService;

/**
 * Servlet implementation class UpdateTrackingNo
 */
@WebServlet("/updateTrackingNo.do")
public class UpdateTrackingNo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateTrackingNo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		String trackingNo = request.getParameter("trackingNo");

		int result = new OrderService().updateTrackingNo(orderNo, trackingNo);

		String msg = null;
		if (result > 0)
			msg = "배송지 정보가 수정되었습니다.";
		else
			msg = "운송장번호 저장 중 오류가 발생했습니다.";
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(msg, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
