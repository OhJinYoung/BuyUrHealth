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

/**
 * Servlet implementation class UpdateQABoardFormServlet
 */
@WebServlet("/updateQABoardForm.bo")
public class UpdateQABoardFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQABoardFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		String category = request.getParameter("category");
		String date = request.getParameter("date");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		content = content.replaceAll("<br>", "\r\n");
		ArrayList<QAFile> qafile = new QABoardService().selectFile(bId);
		
		String[] dateArr = date.split("-");
		int year = Integer.parseInt(dateArr[0]);
		int month = Integer.parseInt(dateArr[1])-1;
		int day = Integer.parseInt(dateArr[2]);
		
		Date dat = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());


		QABoard b = new QABoard(bId, title, content, dat, category);
		
		request.setAttribute("b", b);
		request.setAttribute("qafile", qafile);
		request.getRequestDispatcher("WEB-INF/views/qaboard/qaBoardUpdate.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
