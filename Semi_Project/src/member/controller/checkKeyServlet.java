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
			writer.println("<script>alert('인증번호 일치하지않습니다.');</script>"); 
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/errorFail.jsp");
			view.forward(request, response);
			
		}else {
			// 여기다가 이메일 인증을 을해서 성공을 해야만 이 과정을 거쳐야만 status에 변화를 줘서 회원가입에 성공할수있도록 한다.
			
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
