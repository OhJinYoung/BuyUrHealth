package QABoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABoard.model.service.QABoardService;
import QABoard.model.vo.QABoard;

/**
 * Servlet implementation class UpdateQABoardServlet
 */
@WebServlet("/updateQAAnswer.bo")
public class UpdateQAAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQAAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		String anContent = request.getParameter("anContent");
		anContent = anContent.replace("\r\n", "<br>");
		
		QABoard b = new QABoard();
		b.setQaNo(bId);
		b.setQaAnswer(anContent);
		
		int result = new QABoardService().insertAnQABoard(b, bId);
		
		if(result > 0) {
			response.sendRedirect("QADetail.bo?bId="+bId);
		} else {
			request.setAttribute("msg", "게시글 수정에 실패하였습니다.");
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