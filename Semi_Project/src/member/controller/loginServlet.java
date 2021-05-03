package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;


/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login.me")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id  = request.getParameter("userId"); 
		String pwd = request.getParameter("userPwd");

		Member member = new Member(id,pwd);
		Member loginUser = new MemberService().loginMember(member); 
		System.out.println(loginUser);
		if(loginUser !=null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				session.setMaxInactiveInterval(600);
				response.sendRedirect(request.getContextPath()); 
				
		}else {
			request.setAttribute("msg", "로그인 실패");

			RequestDispatcher view =
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
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
