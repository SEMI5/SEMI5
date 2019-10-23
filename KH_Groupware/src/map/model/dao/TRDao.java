package map.model.dao;

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

import map.model.vo.TR_SCORE;
import map.model.vo.TR_list;
import sun.rmi.log.LogInputStream;

public class TRDao {
	Properties prop = new Properties();

	public TRDao() {
		String fileName = TRDao.class.getResource("/sql/map/map-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 디비에 있는 맛집 리스트들 
	public ArrayList<TR_list> showlist(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<TR_list> list = null;
		
		String query = prop.getProperty("showlist");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<TR_list>();
			while (rset.next()) {
				TR_list tl = new TR_list(rset.getInt("trNo"),
						                 rset.getString("tr_Name"),
						                 rset.getString("tr_Memo"),
						                 rset.getString("tr_LatLng"),
						                 rset.getString("status"),
						                 rset.getInt("user_no")
										 );
				list.add(tl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	// 디비에 맛집등록하기
	public int insertTR(Connection conn, TR_list tr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTR");
		
		try {
			pstmt = conn.prepareStatement(query);
			//pstmt.setString(1, tr.getStId());
			pstmt.setString(1, tr.getTrName());
			pstmt.setString(2, tr.getTrMemo());
			pstmt.setString(3, tr.getTrLatLng()); 
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// TR_SCORE 수정(update)하기.
	public int updateScore(Connection conn, TR_SCORE score) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateScore");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, score.getTrNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("dao 잘됨 " + result);
		return result;
	}

	// TR_SCORE 리스트
	/*public ArrayList<TR_SCORE> showScoreList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<TR_SCORE> list = null;
		
		String query = prop.getProperty("showScoreList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<TR_SCORE>();
			while (rset.next()) {
				TR_SCORE tl = new TR_SCORE(
										 rset.getInt("trNo"),
						                 rset.getInt("user_no")
										 );
				list.add(tl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
	
		return list;
	}
*/
	// TR_SCORE 에(TRNO, userNo) 삽입하기.
	public int insertScore(Connection conn, TR_SCORE ts) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertScore");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ts.getTrNo()); 
			pstmt.setInt(2, ts.getLikeScore()); 
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int showScoreList(Connection conn, String trNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("showScoreList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.valueOf(trNo)); 

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int limitLikes(Connection conn, TR_SCORE ts) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("limitLikes");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ts.getTrNo()); 
			pstmt.setInt(2, ts.getLikeScore()); 

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("dao잘되나 라이크 "  + result);
		return result;
	}

	
}
