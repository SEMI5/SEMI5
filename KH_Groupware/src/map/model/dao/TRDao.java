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
	
	// ���� ����Ʈ
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
	
	// ���� ��� 
	public int insertTR(Connection conn, TR_list tr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTR");
		
		try {
			pstmt = conn.prepareStatement(query);
			//pstmt.setString(1, tr.getStId());
			pstmt.setString(1, tr.getTrName());
			pstmt.setString(2, tr.getTrMemo());
			pstmt.setString(3, tr.getTrLatLng()); //�ּ�
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


}
