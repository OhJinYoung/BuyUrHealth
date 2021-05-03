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
 * Servlet implementation class UpdateQABoardServlet
 */
@WebServlet("/QAUpdate.bo")
public class UpdateQABoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQABoardServlet() {
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
		
		ArrayList<String> saveFiles = new ArrayList<String>();		// 바뀐 이름의 파일을 저장할 용도
		ArrayList<String> originFiles = new ArrayList<String>();	// 원본 이름의 파일을 저장할 용도
		
		Enumeration<String> files = multipartRequest.getFileNames(); // getFileNames(): 폼에서 전송된 파일 리스트들의 이름 반환 / getFileNames()의 반환값 : Enumeration (Iterator의 구버전)
		while(files.hasMoreElements()) {
			String name = files.nextElement(); // 사진을 다 넣지 않아도 4321이 다 뜸
			
			if(multipartRequest.getFilesystemName(name) != null) { // getFilesystemName(name) : MyFileRenamePolicy.rename()에서 작성한대로 rename된 파일명 반환
				saveFiles.add(multipartRequest.getFilesystemName(name)); // rename한 이름 가져오기
				originFiles.add(multipartRequest.getOriginalFileName(name)); // 실제 업로드된 파일 이름 가져오기
			}
		}

		
		int category = Integer.parseInt(multipartRequest.getParameter("category"));
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		content = content.replaceAll("<br>", "\r\n");
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo(); // import해야함
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		
		QABoard b = new QABoard();
		b.setQaNo(bId);
		b.setQacateNo(category);
		b.setQaTitle(title);
		b.setQaContent(content);
		
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
			result1 = new QABoardService().updateBoard(b);
		} else {
			result2 = new QABoardService().updateBoard(b, fileList);
		}
		
		if(result1 > 0 || result2 > 0) {
			response.sendRedirect("QADetail.bo?bId="+bId);
			request.setAttribute("fileList", fileList);
		} else {
			request.setAttribute("msg", "게시물 수정에 실패했습니다.");
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
