package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 */
@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public InsertMemberServlet() {
        super();
    }
	 
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8"); 

     
      	String year = request.getParameter("birthyy");
		String month = request.getParameter("birthmm");
		String day = request.getParameter("birthdd");
		
		String birth = (year+month+day);
      
      
      
      String passWord   = request.getParameter("passWord");
      char gender		= request.getParameter("gender").charAt(0);
      String userId		= request.getParameter("userId"); 
      String userName	= request.getParameter("userName");
      String phone		= request.getParameter("phone");
      String email		= request.getParameter("email");
      Member member = new Member(passWord,gender,userId,userName,birth,phone,email,null,'Y',null);
      
      int result = new MemberService().insertMember(member);
      
      System.out.println(result);
      if(result > 0) {
         request.setAttribute("msg", "회원가입에 성공하였습니다.");
         RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/signupSuccess.jsp");
         view.forward(request, response);
      }else {
         request.setAttribute("msg", "회원가입에 실패하였습니다.");
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