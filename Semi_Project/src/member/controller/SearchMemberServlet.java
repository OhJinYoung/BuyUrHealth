package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.PageInfo;
import common.PagingTemplate;
import member.model.service.MemberService;
import member.model.vo.Member;
import order.model.vo.Order;

/**
 * Servlet implementation class SearchMemberServlet
 */
@WebServlet("/searchMember.do")
public class SearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchMemberServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		String filter = request.getParameter("filter");
		String input = request.getParameter("input");
		ArrayList<Member> list = null;

		MemberService mService = new MemberService();
		
		int listCount = mService.listCount(filter,input);
		
		PageInfo pi = new PagingTemplate().getPageInfo(page,listCount);
		
		list = mService.searchMember(filter, input, pi);

		request.setAttribute("filter", filter);
		request.setAttribute("input", input);
		request.setAttribute("page", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/admin/member/memberList.jsp").forward(request, response);
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
