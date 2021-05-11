package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;
import product.model.vo.PageInfo;
import product.model.vo.Product;
import product.model.vo.ProductFile;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/goProduct3")
public class ProductListServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ProductService pService = new ProductService();
		
		int listCount;		// 해당 게시판에 대한 총 게시글 개수
		int currentPage; 	// 현재 페이지 
		int pageLimit; 		// 한 페이지에 표시될 페이지 수
		int boardLimit; 	// 한 페이지에 보일 게시글 최대 개수
		int maxPage; 		// 전체 페이지 중 가장 마지막 페이지
		int startPage;		// 페이징 된 페이지 중 시작 페이지
		int endPage; 		// 페이징 된 페이지 중 마지막 페이지

		
		
		listCount = pService.getlistCount3();
		System.out.println(listCount);
		
		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		pageLimit = 5;  // 한 페이지에 표시될 페이지 수
		boardLimit = 6; // 한 페이지에 보일 게시글 최대 개수

		maxPage = (int)Math.ceil((double)listCount/boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);

		int pcategory = 3;
		ArrayList<Product> pList = pService.selectTList(pi, 1, pcategory);
		ArrayList<ProductFile> fList = pService.selectTList(pi, 2, pcategory);		
		
		String page = null;
		if(pList != null && fList != null) {
			page = "WEB-INF/views/product/prodList3.jsp";
			request.setAttribute("pList",  pList);
			request.setAttribute("fList",  fList);
			request.setAttribute("pi",  pi);
			
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg",  "제품리스트 조회에 실패했습니다");
		}
	
		request.getRequestDispatcher(page).forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
