package map.model.dao;

import static common.JDBCTemplate.close;

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

import map.model.vo.TR_list;

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
	
	// ¸ÀÁý ¸®½ºÆ®
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
						                 rset.getString("tr_StarPoint"),
						                 rset.getString("stId")
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
	
	// ¸ÀÁý µî·Ï 
	public int insertTR(Connection conn, TR_list tr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTR");
		//String query = "INSERT INTO TR VALUES(2 ,'±Ô¹Î', '«S»ê', 'Â«»ÍÀÌ ¸ÀÀÖÀ½', '2p', '34.412, 123.123')";
		
		try {
			pstmt = conn.prepareStatement(query);
			//pstmt.setString(1, tr.getStId());
			pstmt.setString(1, tr.getTrName());
			pstmt.setString(2, tr.getTrMemo());
			pstmt.setString(3, tr.getTrLatLng()); //ÁÖ¼Ò
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


}
