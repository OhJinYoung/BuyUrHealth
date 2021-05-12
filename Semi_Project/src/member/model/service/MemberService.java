package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import Cart.model.dao.CartDAO;
import Cart.model.vo.Cart;
import common.PageInfo;
import member.model.dao.MemberDAO;
import member.model.vo.FavoriteProduct;
import member.model.vo.Member;
import product.model.dao.ProductDAO;
import product.model.vo.ProductFile;

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

	public ArrayList<Member> adminList() {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDAO().adminList(conn);

		close(conn);

		return list;
	}

	public int insertAdmin(Member member) {
		Connection conn = getConnection();

		int result = new MemberDAO().insertAdmin(conn, member);

		if(result>0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);

		return result;
	}
	public int insertMember(Member member) {

		Connection conn = getConnection();

		

		int result = new MemberDAO().insertMember(conn, member);

		

		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public Member idFindInfoMember(Member member) {

		Connection conn = getConnection();

		Member idFindInfo = new MemberDAO().idFindInfoMember(conn, member);
		
		close(conn);
		

		return idFindInfo;

	}


	public Member pwFindInfoMember(Member member) {
		Connection conn = getConnection();

		Member pwFindInfo = new MemberDAO().pwFindInfoMember(conn, member);
		
		close(conn);
		

		return pwFindInfo;
	}

	public int checkId(String inputId) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkId( conn, inputId);
		
		return result;
	}

	public ArrayList<FavoriteProduct> selectFavoriteList(PageInfo pi, int userNo) {
		Connection conn = getConnection();

		ArrayList<FavoriteProduct> list = new MemberDAO().selectFavoriteList(conn, pi, userNo);
		
		close(conn); 
		
		return list;
	}

	public ArrayList<ProductFile> selectTList(int i) {
		Connection conn = getConnection();

		ArrayList<ProductFile> list = null;

		MemberDAO mDAO = new MemberDAO();
		if (i == 1) {
			list = mDAO.selectFList(conn);
		}

		return list;
	}

	public int insertFavorite(FavoriteProduct pf) {
		Connection conn = getConnection();
		
		
		int result = new MemberDAO().insertFavorite(conn, pf);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}

	public int deleteFavorite(int userNo, int pNo) {
		Connection conn = getConnection();
		int result = new MemberDAO().deleteFavorite(conn, userNo, pNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int newPwInfo(String email,String newPwd) {
		Connection conn = getConnection();

		int result = new MemberDAO().newPwInfo(conn,email,newPwd);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

}
