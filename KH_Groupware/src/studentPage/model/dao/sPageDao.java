package studentPage.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import studentPage.model.vo.AppStudy;
import studentPage.model.vo.Study;

public class sPageDao {
	private Properties prop = new Properties();

	public sPageDao() {
		String file = sPageDao.class.getResource("/sql/studentPage/sPage-query.properties").getPath();

		try {
			prop.load(new FileReader(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int openStudy(Connection conn, Study st) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("openStudy");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, st.getUserNo());
			pstmt.setString(2, st.getStName());
			pstmt.setString(3, st.getLocation());
			pstmt.setString(4, st.getTime());
			pstmt.setDate(5, st.getOpenDate());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Study> showStudy(Connection conn, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Study> stList = new ArrayList<Study>();

		String query = prop.getProperty("showStudy");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				stList.add(new Study(rs.getInt("stid"), rs.getInt("user_no"), rs.getString("st_name"),
						rs.getString("st_location"), rs.getString("st_time"), rs.getDate("create_date"),
						rs.getString("status"), rs.getString("user_name")));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return stList;
	}

	public ArrayList<AppStudy> showAppStudy(Connection conn, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AppStudy> asList = new ArrayList<AppStudy>();

		String query = prop.getProperty("showAppStudy");

		try {
			pstmt = conn.prepareStatement(query);
			
			  pstmt.setInt(1, cid);
			  
			  rs=pstmt.executeQuery();
			  
			  while(rs.next()) { 
				  asList.add(new AppStudy(rs.getInt("user_no"),
						  					rs.getInt("stid"),
						  					rs.getDate("app_date"),
						  					rs.getString("user_name"),
						  					rs.getString("phone"),
						  					rs.getString("address")));
			  }
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return asList;
	}

	
	
	public int appStudy(Connection conn, AppStudy as) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("appStudy");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, as.getStNo());
			pstmt.setInt(2, as.getUserNo());
			pstmt.setDate(3, as.getAppDate());
			
			result = pstmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int delAS(Connection conn, int userNo, int stNo) {
		PreparedStatement pstmt = null;
		int result = 0; 
		
		String query = prop.getProperty("deleteAppStudy");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, stNo);

			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		return result;
	}

	public int delStudy(Connection conn, int stNo) {
		PreparedStatement pstmt = null;
		int result = 0; 
		
		String query = prop.getProperty("deleteStudy");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, stNo);

			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		return result;
	}

	public int modStudy(Connection conn, Study st) {
		PreparedStatement pstmt = null;
		int result = 0; 
		
		String query = prop.getProperty("modifyStudy");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, st.getStName());
			pstmt.setString(2, st.getLocation());
			pstmt.setString(3, st.getTime());
			pstmt.setInt(4, st.getStNo());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		return result;
	}

}
