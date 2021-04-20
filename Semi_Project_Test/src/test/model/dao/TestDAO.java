package test.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import test.model.vo.Test;

public class TestDAO {
	private Properties prop = new Properties();
	
	public TestDAO() {
		String fileName = TestDAO.class.getResource("/sql/test/test-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Test> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Test> list = new ArrayList<Test>();
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Test no = new Test(rset.getInt("NOTICE_NO"),
									   rset.getString("NOTICE_TITLE"),
									   rset.getString("NOTICE_CONTENT"),
									   rset.getString("NOTICE_WRITER"),
									   rset.getString("NICKNAME"),
									   rset.getInt("NOTICE_COUNT"),
									   rset.getDate("NOTICE_DATE"));list.add(no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

}
