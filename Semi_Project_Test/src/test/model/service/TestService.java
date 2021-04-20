package test.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import test.model.dao.TestDAO;
import test.model.vo.Test;


public class TestService {
	
	public ArrayList<Test> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Test> list = new TestDAO().selectList(conn);
		
		close(conn);
		return list;
	}
}
