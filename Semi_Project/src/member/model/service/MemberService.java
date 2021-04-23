package member.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.SQLTransactionRollbackException;
import java.util.ArrayList;

import member.model.dao.MemberDAO;
import member.model.vo.Member;
import member.model.vo.Order;

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

	public ArrayList<Member> memberList() {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDAO().memberList(conn);

		close(conn);

		return list;
	}

	public ArrayList<Order> orderList() {
		Connection conn = getConnection();

		ArrayList<Order> list = new MemberDAO().orderList(conn);

		close(conn);

		return list;
	}

	public ArrayList<Order> searchOrder(String filter, String input) {
		Connection conn = getConnection();

		ArrayList<Order> list = new MemberDAO().searchOrder(conn, filter, input);

		close(conn);

		return list;
	}

	public int updateOrder(String select, String[] check) {
		Connection conn = getConnection();

		int result = new MemberDAO().updateOrder(conn,select,check);

		if(result>0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);

		return result;
	}

}
