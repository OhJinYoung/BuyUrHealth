package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.MemberService;

/**
 * Servlet implementation class deleteMemberServlet
 */
@WebServlet("/deleteMember.do")
public class DeleteMembersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMembersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] check = request.getParameterValues("check[]");
		
		int result = new MemberService().deleteMembers(check);
	

		String msg = "";
		if (result > 0) {
			msg = result + "명의 회원을 삭제했습니다.";
		} else {
			msg = "회원 삭제 중 오류가 발생했습니다.";
		}

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(msg, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
