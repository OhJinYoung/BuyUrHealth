package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;

/**
 * Servlet implementation class UpdateMyPageForm
 */
@WebServlet("/updateMyPageForm.do")
public class UpdateMypageForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMypageForm() {
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
		String myBirth = request.getParameter("myBirth");
		String myPhone = request.getParameter("myPhone");
		String myEmail = request.getParameter("myEmail");
		
		Member myInfo = new Member();
		myInfo.setUserNo(myNo);
		myInfo.setUserId(myId);
		myInfo.setUserName(myName);
		myInfo.setGender(myGender);
		myInfo.setBirth(myBirth);
		myInfo.setPhone(myPhone);
		myInfo.setEmail(myEmail);
		
		
		request.setAttribute("myInfo", myInfo);
		request.getRequestDispatcher("WEB-INF/views/member/updateMemberPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
