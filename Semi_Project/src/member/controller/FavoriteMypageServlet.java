package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PageInfo;
import common.PagingTemplate;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FavoriteMyPageServlet
 */
@WebServlet("/favoriteMyPage.me")
public class FavoriteMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getUserId();
		String page = request.getParameter("page");
		MemberService mService = new MemberService();
		
		int listCount = mService.listCount("",null);
		
		PageInfo pi = new PagingTemplate().getPageInfo(page,listCount);
		
//		ArrayList<Member> list = mService.memberList(pi);
		
		Member member = new MemberService().selectMember(id);
		
		String form = null;
		if(member != null) {
			form = "WEB-INF/views/mypage/favoriteMyPage.jsp";
			request.setAttribute("userId", member);
			request.setAttribute("page", pi);
//			request.setAttribute("list", list);
		} else {
			form = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 조회에 실패하였습니다.");
		}
		
		request.getRequestDispatcher(form).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
