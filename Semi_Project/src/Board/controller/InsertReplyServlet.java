package Board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Board.model.service.CommunityService;
import Board.model.vo.Reply;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/insertReply.bo")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		int bId = Integer.parseInt(request.getParameter("bId"));
		String content = request.getParameter("content");
		
		Reply r = new Reply();
		r.setReplyWriter(writer);
		r.setReplyContent(content);
		r.setRefBId(bId);
		
		ArrayList<Reply> list = new CommunityService().insertReply(r);  // ArrayList<Reply> 뒤에 select가 나올수 잇다고 예측 가능

		// ArrayList Ajax로 반환할때  Gson 사용 . lib에 gson 넣어 줌
		response.setContentType("application/json; charset=UTF-8");
//		Gson gson = new Gson();
//		gson.toJson(list, response.getWriter());
		
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gbDate = gb.setDateFormat("yyyy-MM-dd"); 
		Gson gson = gbDate.create();  // GsonBuilde를 가지고  create()하면 gson객체를 만들 수 있음
		gson.toJson(list, response.getWriter());  // toJson해서 보내주기
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
