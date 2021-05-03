package QABoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABoard.model.service.QABoardService;
import QABoard.model.vo.QABoard;
import QABoard.model.vo.QAFile;

/**
 * Servlet implementation class QABoardDetailServlet
 */
@WebServlet("/QADetail.bo")
public class QABoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QABoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		QABoard qaboard = new QABoardService().selectBoard(bId);
		ArrayList<QAFile> qafile = new QABoardService().selectFile(bId);

		
		String page = null;
		if(qaboard != null) {
			request.setAttribute("qaboard", qaboard);
			request.setAttribute("qafile", qafile);
			page = "WEB-INF/views/qaboard/qaBoardDetail.jsp";
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 조회에 실패했습니다.");
			
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