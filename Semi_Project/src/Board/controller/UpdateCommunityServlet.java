package Board.controller;

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

import Board.model.service.CommunityService;
import Board.model.vo.AddFile;
import Board.model.vo.Community;
import QABoard.model.service.QABoardService;
import QABoard.model.vo.QABoard;
import common.MyFileRenamePolicy;
import member.model.vo.Member;
import notice.model.vo.Notice;

/**
 * Servlet implementation class UpdateCommunityServlet
 */
@WebServlet("/UpdateComm.up")
public class UpdateCommunityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCommunityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
		int maxSize = 1024*1024*10;	
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "uploadFiles\\communityUpload/";
		
		File f = new File(savePath); 
		if(!f.exists()) {
			f.mkdirs();	
		}
		
		MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		ArrayList<String> saveFiles = new ArrayList<String>();
		ArrayList<String> originFiles = new ArrayList<String>();
		
		Enumeration<String> files = multipartRequest.getFileNames(); 
		
		while(files.hasMoreElements()) {
			String name = files.nextElement();
			
			if(multipartRequest.getFilesystemName(name) != null) {
				saveFiles.add(multipartRequest.getFilesystemName(name));
				originFiles.add(multipartRequest.getOriginalFileName(name));
			}
		}
		
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		int ctgNo = 30;
		
		Community c = new Community();
		c.setCommTitle(title);
		c.setCommContent(content);
//		c.setBoardType(2);
		c.setUserName(writer);
		c.setCtgNo(ctgNo); 
		
		ArrayList<AddFile> fileList = new ArrayList<AddFile>();
		for(int i = originFiles.size() - 1; i >= 0; i--) {
			AddFile af = new AddFile();
			af.setFilePath(savePath);
			af.setfName(originFiles.get(i));
			af.setChangeName(saveFiles.get(i));
			
			if(i == originFiles.size() - 1) {
				af.setfYN("Y");
			} else {
				af.setfYN("N");
			}
			
			fileList.add(af);
		}	
		
		response.sendRedirect("goCommunity");
		request.getRequestDispatcher("WEB-INF/views/notice/communityUpdate.jsp").forward(request, response);
		
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
