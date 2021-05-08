package Board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.service.CommunityService;
import Board.model.vo.Reply;
import Community.model.vo.Board;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/detail.bo")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));  // bId로 넘겨줬으니까, bId로 받아와야
		
		Board board = new CommunityService().selectBoard(bId); 
		
		ArrayList<Reply> list = new CommunityService().selectReplyList(bId); 
		// 해당게시물에 대한 댓글만 가져오면 됨 (없을수도잇지만, 여러개가 있을수도잇으니 반환값을 ArrayList)
		
		String page = null;
		if(board != null) {
			page = "WEB-INF/views/board/boardDetail.jsp";
			request.setAttribute("board", board);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세조회에 실패하였습니다.");
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
