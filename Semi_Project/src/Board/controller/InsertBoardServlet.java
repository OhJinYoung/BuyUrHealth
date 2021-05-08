package Board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.service.CommunityService;
import Community.model.vo.Board;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.bo")
public class InsertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");  //post방식으로 넘겼을테니까
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");  
		String writer = ((Member)(request.getSession().getAttribute("loginUser"))).getUserId();
		
		Board b = new Board();
		b.setCategory(category);
		b.setBoardTitle(title);
		b.setBoardContent(content);
		b.setBoardWriter(writer);
		b.setBoardType(1);  // BoardType도 넣어줌, 이걸 가지고 사진게시판때도 이용할꺼니까 
		
		int result = new CommunityService().insertBoard(b);
		
		if(result > 0) {
			response.sendRedirect("list.bo");
		} else {
			request.setAttribute("msg", "게시글 작성에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
