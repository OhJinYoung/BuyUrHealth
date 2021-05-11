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
    
    // 받아와야하는것 제목, 이미지, 사진내용 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //post방식으로 들어왔으니까 
		
		if(ServletFileUpload.isMultipartContent(request)) { // enctype이 multipart/form-data로 전송되었는지 확인
		// 내가 보낸게 encType="multipart/form-data"로 넘어왔냐고 확인하는것
			
			int maxSize = 1024*1024*10; // 전송파일 용량 : 10Mbyte  (<-크기지정)
			String root = request.getSession().getServletContext().getRealPath("/"); // 어디에 저장할지 폴더 
			// getRealPath("/") -> "/" 가장 처음 루트로 돌아가겠다는 것 (백단은 웹에서 화면에서 보이는 부분이 아님, 기능단이지)
			// websever 컨터이너 경로를 추출하는건데 그게 webcontent라고 생각하면 됨 
			
			String savePath = root + "uploadFiles\\communityUpload/";
			// JSPSvevletSever 들어가서 serve modules without publising 체크해주기 
			//-> publising 없이, 니네가 알아서 계산하는거 없이 모듈사용할래라는 것 파일할때는 항상 체크해줘야 경로 이상하게 가지 않음!-> 체크해야지 내가 아는 경로 나옴
			
			File f = new File(savePath); // io하면서 배웠던거
			if(!f.exists()) { // 존재하지 않는다면
				f.mkdirs();  // 폴더만들어주는것
			}


			// 원래 가지고 있던request와, 저장하겠다는 경로savePath, 파일의 최대 사이즈maxSize, 인코딩방식"UTF-8", rename을 하겠다면 무엇으로 하겠다->new MyFileRenamePolicy()
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
													// ㄴ> cos.jar가 잇었기 때문에 존재가 드러남
			// String저장할수있는 ArrayList만들어줌
			ArrayList<String> saveFiles = new ArrayList<String>();		// 바뀐 이름의 파일을 저장할 용도  // sql에서 CHANGE_NAME은 바뀐거 
			ArrayList<String> originFiles = new ArrayList<String>();	// 원본 이름의 파일을 저장할 용도 // sql에서 ORIGIN_NAME 원래 이름
			
			// multipartRequest 이용해서 view에서 보낸 파일 외에 여러가지 가져옴
			Enumeration<String> files = multipartRequest.getFileNames(); // getFileNames() : 폼에서 전송된 파일 리스트들의 name들 반환
																		// Enumeration -> 컬렉션에서 Iterator의 구버전 
			while(files.hasMoreElements()) { // hasMoreElements() 다음 요소가 더 있으면
				String name = files.nextElement(); // nextElement()를 이용해서 String값을 뽑아낼 수 있음
				
				if(multipartRequest.getFilesystemName(name) != null) { // getFilesystemName(name) : MyFileRenamePolicy.rename()에서 작성한대로 rename된 파일명 반환
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
					// multipartRequest.getOriginalFileName(name) : 실제 업로드된 파일 이름 반환
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
				response.sendRedirect("goCommunity");
			} else {
				request.setAttribute("msg", "사진 게시판 등록에 실패하였습니다.");
				
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
