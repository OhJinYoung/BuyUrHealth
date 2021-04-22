package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
<<<<<<< HEAD

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member member = new MemberDAO().selectMember(conn, userId);
		
		close(conn);
		
		return member;
=======
import java.util.ArrayList;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	public Member selectMember(String userId) {
		Connection conn = getConnection();

		Member member = new MemberDAO().selectMember(conn, userId);

		close(conn);

		return member;
	}

	public ArrayList<Member> memberList() {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDAO().memberList(conn);

		close(conn);

		return list;
>>>>>>> refs/remotes/origin/master
	}

}
