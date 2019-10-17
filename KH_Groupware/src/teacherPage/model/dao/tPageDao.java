package teacherPage.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;

public class tPageDao {

	private Properties prop = new Properties();
	
	public tPageDao() {
		String file = tPageDao.class.getResource("/sql/teacherPage/tPage-query.properties").getPath();
		
		try {
			prop.load(new FileReader(file));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	
	}



	public int updateDetailStd(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getStdLv());
			pstmt.setString(2, member.getMajor());
			pstmt.setString(3, member.getSmoking());
			pstmt.setString(4, member.getExp());
			pstmt.setString(5, member.getConsult());
			pstmt.setInt(6, member.getUserNo());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}



	public int appJoin(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("approvalJoin");
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}



	public int updateSeat(Connection conn, ArrayList<Member> csList) {
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateSeat");
		
		try {
			
			for(int i = 0 ; i < csList.size() ; i++ ) {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, csList.get(i).getSeat());
				pstmt.setInt(2, csList.get(i).getUserNo());
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);

		}
		
		return result;
	}
	
	
}
