package board.model.dao;

//Dao클래스 처음 만들면 이거 먼저!!
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

import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Reply;

public class NBoardDao {
	Properties prop = new Properties();

	public NBoardDao() {
		String fileName = NBoardDao.class.getResource("/sql/board/Nboard-query.properties").getPath();
		
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
		
		String query = prop.getProperty("getNBoardListCount");
		
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
	
	public int getListCount(Connection conn, String type, String searchWord) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		String query = ""; 
		
		try {
			if(type.equals("all")) {
				query = prop.getProperty("allListCount");
				pstmt = conn.prepareStatement(query);
				String searchWord2= "%"+searchWord+"%";
				pstmt.setString(1, searchWord2);
				pstmt.setString(2, searchWord2);
				pstmt.setString(3, searchWord2);
				rs = pstmt.executeQuery();
			}else if(type.equals("btitle")) {
				
				query = prop.getProperty("btitleListCount");
				pstmt = conn.prepareStatement(query);
				String searchWord2= "%"+searchWord+"%";
				pstmt.setString(1, searchWord2);
				rs = pstmt.executeQuery();
				
			}else if(type.equals("bcontent")) {
				query = prop.getProperty("bcontentListCount");
				pstmt = conn.prepareStatement(query);
				String searchWord2= "%"+searchWord+"%";
				pstmt.setString(1, searchWord2);
				rs = pstmt.executeQuery();
			}else if(type.equals("user_name")) {
				query = prop.getProperty("bwriterListCount");
				pstmt = conn.prepareStatement(query);
				String searchWord2= "%"+searchWord+"%";
				pstmt.setString(1, searchWord2);
				rs = pstmt.executeQuery();	
			}
			
			if(rs.next()) {
				listCount=rs.getInt(1);	// 쿼리에서의 resultSet 컬럼 값(count(*))을 뽑아내서 int listCount에 담음
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return listCount;
	}
	
	

	public ArrayList<Board> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Board>list = null;
		
		String query = prop.getProperty("selectNList");
		
		// 쿼리문 실행시 조건절에 넣을 변수들(rownum에 대한 조건 시 필요)
		int startRow = (currentPage-1)*limit +1;	
		// ex) 2page면 시작 번호가 11번일 것이다.
		int endRow = startRow + limit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<Board>();	// 컬렉션(ArrayList)는 반드시 기본생성자로 초기화 해놓고 활용하자!!
			
			while(rs.next()) {
				Board b = new Board(rs.getInt("BID"),
									rs.getInt("CID"),
									rs.getString("BTITLE"),
									rs.getString("BTYPE"),
									rs.getString("BCONTENT"),
									rs.getString("USER_NAME"),
									rs.getInt("bcount"),
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
	
	public ArrayList<Board> selectList(String type, String searchWord, Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Board>list = null;
		
		
		
		// 쿼리문 실행시 조건절에 넣을 변수들(rownum에 대한 조건 시 필요)
		int startRow = (currentPage-1)*limit +1;	
		// ex) 2page면 시작 번호가 11번일 것이다.
		int endRow = startRow + limit -1;
		String query = null;
		String searchWord2= null;
		Statement stmt = null;
		searchWord2= "%"+searchWord+"%";
		try {
				if(type.equals("all")) { 
					query = prop.getProperty("selectSearchAll");
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, searchWord2);
					pstmt.setString(2, searchWord2);
					pstmt.setString(3, searchWord2);
					pstmt.setInt(4, startRow);
					pstmt.setInt(5, endRow);
					rs=pstmt.executeQuery();
				}else {
					 query = "select * FROM (SELECT ROWNUM RNUM,BID,CID,BTITLE,BCONTENT,BTYPE,USER_NAME,BCOUNT,CREATE_DATE,MODIFY_DATE,STATUS "  
						    + "FROM N_BLIST " 
						    + "WHERE "+type+" LIKE ('"+searchWord2 +"')) "
							+ "WHERE RNUM BETWEEN "+ currentPage+ " AND " + limit ;
					stmt= conn.createStatement();
					rs=stmt.executeQuery(query);
				}
			list = new ArrayList<Board>();	// 컬렉션(ArrayList)는 반드시 기본생성자로 초기화 해놓고 활용하자!!
			while(rs.next()) {
				Board b = new Board(rs.getInt("BID"),
									rs.getInt("CID"),
									rs.getString("BTITLE"),
									rs.getString("BTYPE"),
									rs.getString("BCONTENT"),
									rs.getString("USER_NAME"),
									rs.getInt("bcount"),
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

	
	

	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNBoard");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, b.getcId());
			pstmt.setString(2,  b.getbTitle());
			pstmt.setString(3,  b.getBtype());
			pstmt.setString(4, b.getbContent());
			pstmt.setString(5,  b.getbWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Board selectBoard(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Board b = null;
		
		String query = prop.getProperty("selectNBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
		
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				b = new Board(rs.getInt("BID"),
						rs.getInt("CID"),
						rs.getString("BTITLE"),
						rs.getString("BTYPE"),
						rs.getString("BCONTENT"),
						rs.getString("USER_NAME"),
						rs.getInt("bcount"),
						rs.getDate("create_date"),
						rs.getDate("modify_date"),
						rs.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return b;
	}

	public int updateCount(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			result = pstmt.executeUpdate();
 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList selectBList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String query = prop.getProperty("selectBList");
		
		try {
			stmt = conn.createStatement();
			rs=stmt.executeQuery(query);
			list = new ArrayList();
			
			while(rs.next()) {
				list.add(new Board(rs.getInt("bid"),
									rs.getInt("btype"),
									rs.getString("cname"),
									rs.getString("btitle"),
									rs.getString("bcontent"),
									rs.getString("user_name"),
									rs.getInt("bcount"),
									rs.getDate("create_date"),
									rs.getDate("modify_date"),
									rs.getString("status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return list;
	}

	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list=new ArrayList();
			
			while(rs.next()) {
				list.add(new Attachment(rs.getInt("bid"),
										rs.getString("change_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int insertThBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertThBoard");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, Integer.valueOf(b.getbWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNAttachment");
		
		try {
			for(int i=0; i<fileList.size();i++) {
				Attachment at = fileList.get(i);
				
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		// fileList가 가진 파일 갯수만큼의 행이 모두 insert가 되었다면
		if(result == fileList.size())
			return result;
		else
			return 0;

	}

	public ArrayList<Attachment> selectThumbnail(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectThumbnail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();	//중요쓰!!!
			
			while(rs.next()) {
				Attachment at = new Attachment();
				at.setfId(rs.getInt("fid"));
				at.setbId(rs.getInt("bid"));
				at.setOriginName(rs.getString("origin_name"));
				at.setChangeName(rs.getString("change_name"));
				at.setFilePath(rs.getString("file_path"));
				at.setUploadDate(rs.getDate("upload_date"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}

	public Attachment selectAttachment(Connection conn, int fid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Attachment at = null;
		
		String query = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, fid);
			
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				at = new Attachment();
				
				at.setOriginName(rs.getString("origin_name"));
				at.setChangeName(rs.getString("change_name"));
				at.setFilePath(rs.getString("file_path"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return at;
	}

	public int updateDownloadCount(Connection conn, int fid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDownloadCount");
		
		try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, fid);
				
				result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Reply> rlist = null;
		
		String query = prop.getProperty("selectReplyList");	// board-query.properties에 만들자
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rs=pstmt.executeQuery();
			
			rlist = new ArrayList<Reply>();
			
			while(rs.next()) {
				rlist.add(new Reply(rs.getInt("rid"),
									rs.getString("rcontent"),
									rs.getInt("ref_bid"),
									rs.getString("user_name"),
									rs.getDate("create_date"),
									rs.getDate("modify_date"),
									rs.getString("status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	
		
		return rlist;
	}

	public int insertReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,  r.getrContent());
			pstmt.setInt(2, r.getRefBid());
			pstmt.setInt(3, Integer.valueOf(r.getrWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}





	
	
	
	
	
	
}
