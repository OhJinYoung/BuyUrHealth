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

/*사진게시판은 어려셔워 따로 페이징처리 안함, 사진게시판만 순수하게 보는걸로 , 사진게시판은 -> 게시판정보, 사진정보 두가지를 각각 불러와야한다*/
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
    /* 사진게시판은 -> 게시판정보, 사진정보 두가지를 각각 불러와야한다 그래서 서비스를 두번 왓다갔다해야한다,
       	그래서 서비스를 객체생성하지않고 레퍼런스변수로 만들어준다  */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommunityService cService = new CommunityService();
		
		// 둘이 같은 메소드를 사용하는데 0,1이냐에 따라서 다른 dao로 넘겨줄 것
		ArrayList<Community> cList = cService.selectCList(30); // 게시판 리스트 가져오기   //  CList : 썸네일리스트
		ArrayList<AddFile> fList = cService.selectCList(10); // 파일 리스트 가져오기 
		System.out.println(cList);
		System.out.println(fList);
		
		String page = null;
		if(cList != null && fList != null) { // 하나라도 null이면 안됨
			request.setAttribute("cList", cList);
			request.setAttribute("fList", fList);
			page = "WEB-INF/views/community/communityList.jsp";
		} else { // 하나라도 null이면
			request.setAttribute("msg", "커뮤니티 조회에 실패하였습니다.");
			page = "WEB-INF/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response); // 결과에 따라서 페이지를 나눠줌
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
