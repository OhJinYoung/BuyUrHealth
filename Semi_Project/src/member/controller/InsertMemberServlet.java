package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Param;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		

		
		
		
		
		
		
//		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String passWord	= request.getParameter("passWord");
		char gender		= request.getParameter("gender").charAt(0);
		String userId   = request.getParameter("userId"); 
		String userName = request.getParameter("userName");
		String phone    = request.getParameter("phone");
		String email    = request.getParameter("email");
		// 보내기 힘드니 member에 담아 보낸다
		Member member = new Member(passWord,gender,userId,userName,null,phone,email,null,'Y',null);
//		Member member = new Member(passWord,gender,userId,userName,null,phone,email,null);
		// 받아온 데이터를 db에 보내기 위해 어디로 보내야하는가? 그것은 바로 서비스부분!
		//성공한 행의 갯수를 받아오니깐 int
		int result = new MemberService().insertMember(member);
		if(result > 0) {
//			response.sendRedirect(request.getContextPath());
//			request.getRequestDispatcher("WEB-INF/views/common/mainView.jsp");
			request.setAttribute("msg", "회원가입에 성공하셨습니다.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/signupSuccess.jsp");
			view.forward(request, response);
		}else {
			request.setAttribute("msg", "회원가입에 실패하셨습니다.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
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
