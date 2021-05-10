package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dao.MemberDAO;
import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet("/idFindPo.me")
public class idFindPossible extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public idFindPossible() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Member member = new Member(userName,email,phone);
		Member UserInfo = new MemberService().idFindInfoMember(member); 
		if(UserInfo !=null) {
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/id_logSuccess.jsp");
			request.setAttribute("UserInfo", UserInfo);
			view.forward(request, response); 
		}else {
			request.setAttribute("msg", "인증에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			view.forward(request, response); 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
