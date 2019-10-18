package share.model.dao;

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

import share.model.vo.Attachment;
import share.model.vo.Share;

public class SFileDao {
	Properties prop = new Properties();
	
	public SFileDao() {
		String fileName = SFileDao.class.getResource("/sql/share/SFile-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {		
			e.printStackTrace();
		} catch (IOException e) {	
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection conn) {

		Statement stmt = null;
		ResultSet rs = null;
		
		int listCount = 0;
		
		String query = prop.getProperty("getSFileListCount");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				listCount=rs.getInt(1);	// 쿼리에서의 resultSet 컬럼 값(count(*))을 뽑아내서 int listCount에 담음
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}
		return listCount;
	}

	public ArrayList<Share> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Share>list = null;
		
		String query = prop.getProperty("selectSFList");
		
		// 쿼리문 실행시 조건절에 넣을 변수들(rownum에 대한 조건 시 필요)
		int startRow = (currentPage-1)*limit +1;	
		// ex) 2page면 시작 번호가 11번일 것이다.
		int endRow = startRow + limit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<Share>();	// 컬렉션(ArrayList)는 반드시 기본생성자로 초기화 해놓고 활용하자!!
			
			while(rs.next()) {
				Share b = new Share(rs.getInt("BID"),
									rs.getInt("CID"),
									rs.getString("BTITLE"),
									rs.getString("BTYPE"),
									rs.getString("BCONTENT"),
									rs.getInt("bcount"),
									rs.getString("USER_NAME"),
									rs.getDate("create_date"),
									rs.getDate("modify_date"),
									rs.getString("status"));
				list.add(b);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	public int insertShare(Connection conn, Share b) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertShare");	
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, Integer.valueOf(b.getbWriter()));
			
			result = pstmt.executeUpdate();
			
			System.out.println("insertShare" + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSATTACH");	
		
		try {
			
			// 컬랙션의 값을 하나하나
			for (int i =0; i <fileList.size(); i++) {
			Attachment at = fileList.get(i);	
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileLevel());
			
			result += pstmt.executeUpdate();	// fileList.size 크기만큼 result에 쌓임
			
			}
			System.out.println("insertSATTACH" + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		// fileList가 가진 파일 갯수만큼의 행이 모두 insert가 되었다면
		if(result == fileList.size())
			return result;
		else
			return 0;
	}
	
	
	
	
	
	
}
