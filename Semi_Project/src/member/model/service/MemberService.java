package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member member = new MemberDAO().selectMember(conn, userId);
		
		close(conn);
		
		return member;
	}

}
