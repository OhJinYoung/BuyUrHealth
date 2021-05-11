package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Cart.model.service.CartService;
import common.PageInfo;
import common.PagingTemplate;
import member.model.service.MemberService;
import member.model.vo.FavoriteProduct;
import member.model.vo.Member;
import product.model.vo.ProductFile;

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
		String userId = loginUser.getUserId();
		String page = request.getParameter("page");
		int userNo = loginUser.getUserNo();
		
		Member member = new MemberService().selectMember(userId);
		
		System.out.println(member);
		
		MemberService mService = new MemberService();
		
		int listCount = mService.listCount("",null);
		
		PageInfo pi = new PagingTemplate().getPageInfo(page,listCount);
		
		ArrayList<FavoriteProduct> favoriteList = mService.selectFavoriteList(pi, userNo);
		
		ArrayList<ProductFile> fList = mService.selectTList(1);
		System.out.println(fList);
		
		
		String form = null;
		if(member != null) {
			form = "WEB-INF/views/mypage/favoriteMyPage.jsp";
			request.setAttribute("userId", member);
			request.setAttribute("page", pi);
			request.setAttribute("favoriteList", favoriteList);
			request.setAttribute("fList",  fList);
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
