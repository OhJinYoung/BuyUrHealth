package member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.*;



@WebServlet("/pwFindPo.me")
public class pwFindPossible extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public pwFindPossible() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 
		String userId	= request.getParameter("userId");
		String userName = request.getParameter("userName");
		String email	= request.getParameter("email");
		String phone	= request.getParameter("phone");
		
		Member member = new Member(userId,userName,email,phone);
		Member UserInfo = new MemberService().pwFindInfoMember(member); 
			
			
		if(UserInfo !=null) {
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/pw_logSuccess.jsp");
			request.setAttribute("UserInfo", UserInfo);
			view.forward(request, response); 
		}else {
			request.setAttribute("msg", "비밀번호 찾기에 실패하셨습니다.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			view.forward(request, response); 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
