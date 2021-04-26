package member.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/goMypage")
public class UpdateMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String page = null;
		Member loginUser = (Member)session.getAttribute("loginUser");
		try {
			String userId = loginUser.getUserId();
			Member member = new MemberService().selectMember(userId);
			
			if(member != null) {
				page = "WEB-INF/views/mypage/updateMyPage.jsp";
				request.setAttribute("userId", member);
			} else {
				page = "WEB-INF/views/common/errorPage.jsp";
				request.setAttribute("msg", "회원 조회에 실패하였습니다.");
			}
		} catch(Exception e){
			page = "WEB-INF/views/member/rogin.jsp";
		} finally {
			request.getRequestDispatcher(page).forward(request, response);
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
