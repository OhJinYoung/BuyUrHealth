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

      // 생일의 경우 <select>로 되어 있는데 파라미터 값을 받을 시 배열형태로 넘겨 받는다.
//      String[] birthmm = request.getParameterValues("birth_mm");
//      String birthdd = request.getParameter("birth_dd");
     
      	String year = request.getParameter("birthyy");
		String month = request.getParameter("birthmm");
		String day = request.getParameter("birthdd");
		
		String birth = (year+month+day);
//		Date birth = Date.valueOf(year+"-"+month+"-"+day);
      
      
      
      String passWord   = request.getParameter("passWord");
      char gender		= request.getParameter("gender").charAt(0);
      String userId		= request.getParameter("userId"); 
      String userName	= request.getParameter("userName");
//      String birth		= request.getParameter("birth");
      String phone		= request.getParameter("phone");
      String email		= request.getParameter("email");
//      String userDate	= request.getParameter("userDate");
      // 보내기 힘드니 member에 담아 보낸다
      Member member = new Member(passWord,gender,userId,userName,birth,phone,email,null,'Y',null);
      
//      Member member = new Member(passWord,gender,userId,userName,null,phone,email,null);
      // 받아온 데이터를 db에 보내기 위해 어디로 보내야하는가? 그것은 바로 서비스부분!
      //성공한 행의 갯수를 받아오니깐 int
      
      int result = new MemberService().insertMember(member);
      
      System.out.println(result);
      if(result > 0) {
//         response.sendRedirect(request.getContextPath());
//         request.getRequestDispatcher("WEB-INF/views/common/mainView.jsp");
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