package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateMember
 */
@WebServlet("/update.me")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int myNo = Integer.parseInt(request.getParameter("myNo"));
		String myId = request.getParameter("id");
		String myName = request.getParameter("myName");
		char myGender = request.getParameter("myGender").charAt(0);
		String myPhone = request.getParameter("myPhone");
		String myEmail = request.getParameter("myEmail");
		
		Member myInfo = new Member();
		myInfo.setUserId(myId);
		myInfo.setUserName(myName);
		myInfo.setGender(myGender);
		myInfo.setPhone(myPhone);
		myInfo.setEmail(myEmail);
		myInfo.setUserNo(myNo);
		
		int result = new MemberService().updateMypageMember(myInfo);
		
		if(result > 0) {
			response.sendRedirect("goMypage");
		} else {
			request.setAttribute("msg", "회원정보 수정에 실패했습니다.");
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
