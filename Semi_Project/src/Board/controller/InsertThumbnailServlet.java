package Board.controller;

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

import Board.model.service.CommunityService;
import Board.model.vo.AddFile;
import Board.model.vo.Community;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertThumbnailServlet
 */
@WebServlet("/insert.th")
public class InsertThumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertThumbnailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		if(ServletFileUpload.isMultipartContent(request)) { 
		
			int maxSize = 1024*1024*10; // 전송파일 용량 : 10Mbyte  (<-크기지정)
			String root = request.getSession().getServletContext().getRealPath("/"); 
			
			String savePath = root + "uploadFiles\\communityUpload/";
			
			File f = new File(savePath); 
			if(!f.exists()) { 
				f.mkdirs();  
			}

			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
													
			// String저장할수있는 ArrayList만들어줌
			ArrayList<String> saveFiles = new ArrayList<String>();		// 바뀐 이름의 파일을 저장할 용도  // sql에서 CHANGE_NAME은 바뀐거 
			ArrayList<String> originFiles = new ArrayList<String>();	// 원본 이름의 파일을 저장할 용도 // sql에서 ORIGIN_NAME 원래 이름
			
			// multipartRequest 이용해서 view에서 보낸 파일 외에 여러가지 가져옴
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
//			c.setBoardType(2);
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
			
			int result = new CommunityService().insertThumbnail(c, fileList);
			
			if(result > 0) {
				response.sendRedirect("insert.th");
			} else {
				request.setAttribute("msg", "등록에 실패하였습니다.");
				
				for(int i = 0; i < saveFiles.size(); i++) {
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete();
				}
				
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
