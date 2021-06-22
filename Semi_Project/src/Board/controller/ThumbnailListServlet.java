package Board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.service.CommunityService;
import Board.model.vo.AddFile;
import Board.model.vo.Community;

/**
 * Servlet implementation class ThumbnailListServlet
 */

@WebServlet("/goCommunity")
public class ThumbnailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommunityService cService = new CommunityService();
		
	
		ArrayList<Community> cList = cService.selectCList(30); // 게시판 리스트 가져오기   //  CList : 썸네일리스트
		ArrayList<AddFile> fList = cService.selectCList(10); // 파일 리스트 가져오기 
		System.out.println(cList);
		System.out.println(fList);
		
		String page = null;
		if(cList != null && fList != null) { 
			request.setAttribute("cList", cList);
			request.setAttribute("fList", fList);
			page = "WEB-INF/views/community/communityList.jsp";
		} else { 
			request.setAttribute("msg", "커뮤니티 조회에 실패하였습니다.");
			page = "WEB-INF/views/common/errorPage.jsp";
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
