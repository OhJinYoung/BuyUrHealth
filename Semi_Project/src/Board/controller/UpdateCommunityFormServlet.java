package Board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.service.CommunityService;
import Board.model.vo.AddFile;
import Board.model.vo.Community;


/**
 * Servlet implementation class UpdateCommunityFormServlet
 */
@WebServlet("/communityUpdateForm.co")
public class UpdateCommunityFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCommunityFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		int bId = Integer.parseInt(request.getParameter("bId"));
//		String category = request.getParameter("category");
		String commDate = request.getParameter("commDate");
		String commTitle = request.getParameter("commTitle");
		String commContent = request.getParameter("commContent");
//		commContent = commContent.replaceAll("<br>", "\r\n");
//		ArrayList<AddFile> addfile = new CommunityService().selectFile(bId);
		
//		String[] dateArr = commDate.split("-");
//		int year = Integer.parseInt(dateArr[0]);
//		int month = Integer.parseInt(dateArr[1])-1;
//		int day = Integer.parseInt(dateArr[2]);
		
//		Date dat = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());


		Community c = new Community(0, commTitle, commContent,  null, 0, 0, commDate,  0, commContent); //  ??
		
		request.setAttribute("c", c);
//		request.setAttribute("addfile", addfile);
		request.getRequestDispatcher("WEB-INF/views/community/communityUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
