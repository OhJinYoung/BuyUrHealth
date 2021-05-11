package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Cart.model.service.CartService;
import common.PageInfo;
import common.PagingTemplate;
import member.model.service.MemberService;
import member.model.vo.FavoriteProduct;
import member.model.vo.Member;
import product.model.vo.ProductFile;

/**
 * Servlet implementation class InsertFavoriteMypage
 */
@WebServlet("/InsertFavorite")
public class InsertFavoriteMypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFavoriteMypage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String page = request.getParameter("page");
		
		String productName = request.getParameter("productName").trim(); // 제품번호
		int productPrice = Integer.parseInt(request.getParameter("total").trim()); // 제품번호
		int productNo = Integer.parseInt(request.getParameter("productNo").trim()); // 제품번호
		
		System.out.println(productName);
		System.out.println(productPrice);
		System.out.println(productNo);
		
		
		MemberService mService = new MemberService();
		
		int listCount = mService.listCount("",null);
		
		PageInfo pi = new PagingTemplate().getPageInfo(page,listCount);
		
		FavoriteProduct pf =  new FavoriteProduct(productName, productPrice, userNo, productNo);
		System.out.println(pf);
		
		
		
		
		int result = mService.insertFavorite(pf);
		ArrayList<FavoriteProduct> favoriteList = mService.selectFavoriteList(pi, userNo);
		
		ArrayList<ProductFile> fList = mService.selectTList(1);
		System.out.println(fList);
		
		
		String form = null;
		if(result > 0 && fList != null) {
			form = "WEB-INF/views/mypage/favoriteMyPage.jsp";
			request.setAttribute("page", pi);
			request.setAttribute("favoriteList", favoriteList);
			request.setAttribute("fList",  fList);
		} else {
			form = "WEB-INF/views/mypage/favoriteMyPage.jsp";
			request.setAttribute("page", pi);
			request.setAttribute("favoriteList", favoriteList);
			request.setAttribute("fList",  fList);
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
