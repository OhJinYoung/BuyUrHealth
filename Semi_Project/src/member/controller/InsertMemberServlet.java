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
		// ������ ����� member�� ��� ������
		Member member = new Member(passWord,gender,userId,userName,null,phone,email,null,'Y',null);
//		Member member = new Member(passWord,gender,userId,userName,null,phone,email,null);
		// �޾ƿ� �����͸� db�� ������ ���� ���� �������ϴ°�? �װ��� �ٷ� ���񽺺κ�!
		//������ ���� ������ �޾ƿ��ϱ� int
		int result = new MemberService().insertMember(member);
		if(result > 0) {
//			response.sendRedirect(request.getContextPath());
//			request.getRequestDispatcher("WEB-INF/views/common/mainView.jsp");
			request.setAttribute("msg", "ȸ�����Կ� �����ϼ̽��ϴ�.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/signupSuccess.jsp");
			view.forward(request, response);
		}else {
			request.setAttribute("msg", "ȸ�����Կ� �����ϼ̽��ϴ�.");
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
