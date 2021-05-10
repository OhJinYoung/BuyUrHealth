package QABoard.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import QABoard.model.service.QABoardService;
import QABoard.model.vo.QABoard;
import QABoard.model.vo.QAFile;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateQABoardFormServlet
 */
@WebServlet("/QAAnInsert.bo")
public class InsertQAAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQAAnswerServlet() {
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
		b.setQaAnswer(anContent);
		
		int result1 = 0;
		
		result1 = new QABoardService().insertAnQABoard(b, bId);
		
		if(result1 > 0) {
			response.sendRedirect("QADetail.bo?bId="+bId);
		} else {
			request.setAttribute("msg", "게시물 등록에 실패했습니다.");
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
