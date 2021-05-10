package product.controller;

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

import common.MyFileRenamePolicy;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductFile;

/**
 * Servlet implementation class InsertProductServlet
 */
@WebServlet("/insert.pro")
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 인코딩 파일이 multipart/form-data 인지 확인해야함 
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024*1024*10; // 전송파일 용량 지정 : 10Mbyte
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "uploadFiles/productUpload/"; // 저장될 폴더 지정
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();  // 폴더가 존재하지 않는다면 만들어주기 
			}
			/*
			 	<파일 명 변환 및 저장>
			 	
			 	사용자가 올린 파일 명을 그대로 저장하지 않는 것이 일반적
			 	같은 파일 명이 있을 경우 이전 파일을 덮어 쓸 수 있는 위험(1)이 있고 DB갑과 저장된 파일 명의 이름이 다르면 찾을 수 없음(2)
			 	또한 한글로 되어있거나 특수기호/띄어쓰기 등으로 이루어진 파명은 서버에 따라 문제가 샹길 수 있음(3)
			 	
			 	파일 명 변환 클래스 : DefaultFileRenamePolicy (cos.jar 안에 존재) 
			 		같은 파일 명이 있는지 검사 후 있을 경우 파일명 뒤에 숫자를 붙여줌 (ex. aaa.zip, aaa1.zip, aaa2.zip)
			 		MultipartRequest multupartRequest
			 			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			  
			  			* cos.jar 란?
			  			 = view에서 보낸 파일도 받고, 다른 일반 데이터 값들도 받아주는 역할 
			  
			  
			  하지만 우리는 DefaultFileRenamePolicy를 사용하지 않고 직접, 우리 방식대로, rename작업을 하기 위한 클래스 만들 것
			  --> common.MyFileRenamePolicy
			  
			 */
			
			
			MultipartRequest multupartRequest= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();   // 바뀐 이름의 파일을 저장할 용도 
			ArrayList<String> originFiles = new ArrayList<String>(); // 원본 이름의 파일을 저장할 용도 
			
			
			Enumeration<String> files = multupartRequest.getFileNames(); // getFileNames() : Form에서 전송된 파일 리스트들의 이름 반환
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multupartRequest.getFilesystemName(name) != null) {
					// getFilesystemName(name) : MyFileRenamePolicy.rename()에서 작성한대로 rename된 파일명 반환 
					
					saveFiles.add(multupartRequest.getFilesystemName(name));
					originFiles.add(multupartRequest.getOriginalFileName(name));
					// multupartRequest.getOriginalFileName(name) : 실제 업로드 된 파일 이름 반환 
				}
			}

			int category = Integer.parseInt(multupartRequest.getParameter("category"));
			String name = multupartRequest.getParameter("name");
			int price = Integer.parseInt(multupartRequest.getParameter("price"));
			int volume = Integer.parseInt(multupartRequest.getParameter("volume"));
			String detail = multupartRequest.getParameter("detail");

			Product p = new Product();
			p.setProductName(name);
			p.setCategoryNo(category);
			p.setProductVolume(volume);
			p.setProductDetail(detail);
			p.setProductPrice(price);;
			
			ArrayList<ProductFile> fileList = new ArrayList<ProductFile>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				ProductFile pt = new ProductFile();
				pt.setFilePath(savePath);
				pt.setFileName(originFiles.get(i));
				pt.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size() -1) {
					pt.setFileYN("Y");
				} else {
					pt.setFileYN("N");
				}
				
				fileList.add(pt);
			}
			
			int result = new ProductService().insertProduct(p, fileList);
			
			if(result > 0 ) {
				response.sendRedirect("goProduct");
				
			} else {
				request.setAttribute("msg", "제품 등록에 실패하였습니다.");
			
				for(int i = 0; i< saveFiles.size(); i++) {
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
