package member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmailFormServlet
 */
@WebServlet("/sendEmail.do")
public class EmailFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		String receiver = request.getParameter("receiver");
		/* String title = request.getParameter("title"); */
		/* String title = ""; */
		
		// 난수설정
//		Random r = new Random();
//		int i = r.nextInt(99999)+1111;
		
		// 인증번호생성기
		StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);

		// 난수 string으로 변경
//		String AuthenticationKey = Integer.toString(i);
		
//		AuthenticationKey = "<h1 style='color: blue;'>" + AuthenticationKey + "</h1>";
		
		// 사용할 메일
		String host = "smtp.naver.com";
		//보내는 사람의 메일
		String sender = "buyurhealth@naver.com";
		// 보내는 사람의 비밀번호
		String password = "zz11z1!!";
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", host);
		prop.put("mail.smtp.auth", true);

		// 세션에 보관
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			// 임명 클래스
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);//	보내는 사람과 비밀번호를 담아서 생성자 완료
				
			}
		});
		
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(sender));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			
			// 메일 제목
			msg.setSubject("BUH 계정을 인증해주세요");
			// 메일 내용
			msg.setText(AuthenticationKey, "UTF-8", "html");
			
			Transport.send(msg);
			System.out.println("전송 완료");
		} catch (AddressException e) {
			e.printStackTrace();
			System.out.println("전송 실패");
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("전송 실패");
		}
		HttpSession key = request.getSession();
		key.setAttribute("AuthenticationKey", AuthenticationKey);
		
		/*
		 * response.sendRedirect(request.getContextPath()); // 메인으로 돌아가기
		 */		
		
//		ServletContext context =getServletContext();
//        RequestDispatcher dispatcher = context.getRequestDispatcher("WEB-INF/views/member/mailkey.jsp"); //넘길 페이지
//        dispatcher.forward(request, response);
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/mailkey.jsp");
		view.forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
