package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class checkKeyServlet
 */
@WebServlet("/sendtrue.do")
public class checkKeyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkKeyServlet() {
        super();
        // TODO Auto-generated constructor stub 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
		String AuthenticationUser = request.getParameter("AuthenticationUser");
		
		if(!AuthenticationKey.equals(AuthenticationUser))
		{
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('BUH계정을 입력해주세요.');</script>"); 
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/errorFail.jsp");
			view.forward(request, response);
			
		}else {
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/mailSuccess.jsp");
			view.forward(request, response);
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
