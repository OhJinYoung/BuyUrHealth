package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

@WebServlet("/checkId.me")
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckIdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String inputId = request.getParameter("inputId");
		
		int result = new MemberService().checkId(inputId);
		
		request.setAttribute("result", result);
		request.setAttribute("checkedId", inputId);
		
		request.getRequestDispatcher("WEB-INF/views/member/checkIdForm.jsp").forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
