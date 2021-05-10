package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertAdminServlet
 */
@WebServlet("/insertAdmin.do")
public class InsertAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		char gender = request.getParameter("gender").charAt(0);
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		Member member = new Member(password,gender,id,name,birth,phone,email);

		int result = new MemberService().insertAdmin(member);
		
		String msg = null;
		
		if (result > 0) {
			msg = "관리자 등록 성공";
		} else {
			msg = "관리자 등록 중 오류가 발생했습니다.";
		}
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(msg, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
