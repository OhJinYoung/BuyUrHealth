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
 * Servlet implementation class productUpdateServlet2
 */
@WebServlet("/update.pro")
public class productUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productUpdateServlet2() {
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
				int no = Integer.parseInt(multupartRequest.getParameter("productNo"));
				String name = multupartRequest.getParameter("productName");
				int category = Integer.parseInt(multupartRequest.getParameter("category"));
				int volume = Integer.parseInt(multupartRequest.getParameter("volume"));
				String detail = multupartRequest.getParameter("detail");
				int price = Integer.parseInt(multupartRequest.getParameter("price"));

				Product p = new Product();
				p.setProductNo(no);
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
				
				int result = new ProductService().updateProduct(p, fileList);
				
				if(result > 0 ) {
					request.setAttribute("p", p);
					response.sendRedirect("detail.pro?pNo="+no);
					
				} else {
					request.setAttribute("msg", "제품수정에 실패하였습니다.");
				
					for(int i = 0; i< saveFiles.size(); i++) {
						File fail = new File(savePath + saveFiles.get(i));
						fail.delete();
					}
					request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
