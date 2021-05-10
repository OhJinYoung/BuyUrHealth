package Cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Cart.model.service.CartService;
import Cart.model.vo.Cart;

/**
 * Servlet implementation class VolchangeSevlet
 */
@WebServlet("/volchange")
public class VolchangeSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolchangeSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		int changeVol = Integer.parseInt(request.getParameter("cartVol"));
		
		Cart c = new Cart();
		c.setCartVolume(changeVol);
		c.setProductNo(proNo);
		
		int result = new CartService().updateVol(c);
		
		if(result > 0) {
			response.sendRedirect("goCart");
		} else {
			request.setAttribute("msg", "수량 변경에 실패하였습니다.");
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
