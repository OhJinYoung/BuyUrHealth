package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.PageInfo;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	public Member selectMember(String userId) {
		Connection conn = getConnection();

		Member member = new MemberDAO().selectMember(conn, userId);

		close(conn);

		return member;
	}

	public Member loginMember(Member member) {
		Connection conn = getConnection();
		Member loginUser = new MemberDAO().loginMember(conn, member);

		close(conn);

		return loginUser;
	}

	public ArrayList<Member> memberList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDAO().memberList(conn, pi);

		close(conn);

		return list;
	}

	public ArrayList<Member> searchMember(String filter, String input, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDAO().searchMember(conn, filter, input, pi);

		close(conn);

		return list;
	}

	public int deleteMembers(String[] members) {
		Connection conn = getConnection();

		int result = new MemberDAO().deleteMembers(conn, members);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();

		int result = new MemberDAO().updateMember(conn, member);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int updateMypageMember(Member myInfo) {
		Connection conn = getConnection();

		int result = new MemberDAO().updateMypageMember(conn, myInfo);
		System.out.println(result);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int updatePwd(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();

		int result = new MemberDAO().updatePwd(conn, userId, userPwd, newPwd);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int deleteMember(String userId) {
		Connection conn = getConnection();

		int result = new MemberDAO().deleteMember(conn, userId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int listCount(String filter, String input) {
		Connection conn = getConnection();

		int result = new MemberDAO().listCount(conn, filter, input);

		close(conn);

		return result;
	}

}
