package QABoard.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

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
 * Servlet implementation class InsertQABoardServlet
 */
@WebServlet("/QAInsert.bo")
public class InsertQABoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQABoardServlet() {
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
			String savePath = root + "uploadFiles/qafile_uploadFiles/";
			
			File f = new File(savePath);
		
		MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		ArrayList<String> saveFiles = new ArrayList<String>();		// 바뀐 이름 파일
		ArrayList<String> originFiles = new ArrayList<String>();	// 원본 이름 파일
		
		Enumeration<String> files = multipartRequest.getFileNames(); 
		while(files.hasMoreElements()) {
			String name = files.nextElement(); 
			
			if(multipartRequest.getFilesystemName(name) != null) { 
				saveFiles.add(multipartRequest.getFilesystemName(name)); 
				originFiles.add(multipartRequest.getOriginalFileName(name)); 
			}
		}

		
		int category = Integer.parseInt(multipartRequest.getParameter("category"));
		String qaTitle = multipartRequest.getParameter("qaTitle");
		String qaContent = multipartRequest.getParameter("qaContent");
		qaContent = qaContent.replace("\r\n", "<br>");
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo(); // import해야함
		
		QABoard b = new QABoard();
		b.setQacateNo(category);
		b.setQaTitle(qaTitle);
		b.setQaContent(qaContent);
		b.setUserNo(userNo);
		
			
		ArrayList<QAFile> fileList = new ArrayList<QAFile>();
		for(int i = originFiles.size() - 1; i >= 0; i--) {
			QAFile qaf = new QAFile();
			qaf.setFilePath(savePath);
			qaf.setFileName(originFiles.get(i));
			qaf.setFileChangeName(saveFiles.get(i));
			
			fileList.add(qaf);
		}
		
		int result1 = 0;
		int result2 = 0;
		
		if(fileList.isEmpty()) {
			result1 = new QABoardService().insertBoard(b);
		} else {
			result2 = new QABoardService().insertBoard(b, fileList);
		}
		
		if(result1 > 0 || result2 > 0) {
			response.sendRedirect("goQNA");
			request.setAttribute("fileList", fileList);
		} else {
			request.setAttribute("msg", "게시물 등록에 실패했습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			
			for(int i = 0; i < saveFiles.size(); i++) {
				File fail = new File(savePath + saveFiles.get(i));
				fail.delete();
			}
		}
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