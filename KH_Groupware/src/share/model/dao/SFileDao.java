package share.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;
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
	
	
	
	
	
	
	
	
	
	// 자료실 리스트 갯수 조회용
	public int getListCount(Connection conn) {
		// 게시판의 글 전체 수 구하기
		Statement stmt = null;
		ResultSet rs = null;
				
		int listCount = 0;
				
		String query = prop.getProperty("getListCount");
				
		try {
			stmt = conn.createStatement();
					
			rs = stmt.executeQuery(query);
					
			//여러개의 행을 불러와서 한 행씩  
			// 한개라도 rs는 배열이라 커서를 옮기는 방식으로 뽑아줘야함
			if(rs.next()) {
				listCount = rs.getInt(1);	// 첫번째 컬럼의 값 (count(*)로 select하면 행이 1개가 나오므로 / 결과값이 int)
												// 쿼리에서의 resultSet 컬럼 값(count(*))을 뽑아내서 int listCount에 담음
			}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(stmt);
				close(rs);
			}
				
			return listCount;		

	}

	public ArrayList<Attachment> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Attachment>list = null;
		
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
			
			list = new ArrayList<Attachment>();	// 컬렉션(ArrayList)는 반드시 기본생성자로 초기화 해놓고 활용하자!!
			
			while(rs.next()) {
				Attachment b = new Attachment(rs.getInt("fid"),
								rs.getInt("bid"),
								rs.getString("origin_name"),
								rs.getString("change_name"),
								rs.getString("file_path"),
								rs.getDate("upload_Date"),
								rs.getInt("file_Level"),
								rs.getInt("download_Count"),
								rs.getString("status"),
								rs.getInt("rnum"));
				                
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

	//자료등록
		public int insertShare(Connection conn, Share s) {
			PreparedStatement pstmt = null;
			
			int result = 0;
			
			String query = prop.getProperty("insertShare");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, s.getbTitle());
				pstmt.setString(2, s.getbContent());
				pstmt.setString(3, s.getbWriter());
				
				result = pstmt.executeUpdate();
				
				System.out.println("Dao insert Share:" + result);
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}

	//자료등록 업로드	
	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertATTACH");	
		
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
			System.out.println("Dao insertSATTACH : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("filelist" +fileList);
		// fileList가 가진 파일 갯수만큼의 행이 모두 insert가 되었다면
		if(result == fileList.size())
			return result;
		else
			return 0;
	}
	
	
	// 자료실  - 자료실 게시판 리스트 정보
	public ArrayList selectBList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String qeury = prop.getProperty("selectBList");	// (BLIST는 3개를 join한 view에서) Btype이 2인것만 select 
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(qeury);
			list = new ArrayList();	// 노란줄은 제네릭을 안줘서 
			
			
			while(rs.next()) {
				list.add(new Share(rs.getInt("BID"),		//list에 바로 값넣음 
									rs.getInt("CID"),
									rs.getString("BTITLE"),
									rs.getString("BTYPE"),
									rs.getString("BCONTENT"),
									rs.getInt("BCOUNT"),
									rs.getString("USER_NAME"),
									rs.getDate("CREATE_DATE"),
									rs.getDate("MODIFY_DATE"),
									rs.getString("STATUS")));
				
			}
			System.out.println("dao selectBList:" + list);
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		
		return list;
	}
	
	// 자료실 - 자료 리스트
	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;	
		
		ArrayList list = null;
		
		
		String query = prop.getProperty("selectFList");
									// FILE_LEVEL 우리가 올린사진중에 대표사진
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList();	// 안해주면 null로 나와서 add가 안먹힘
			
			while(rs.next()) {
				list.add(new Attachment(rs.getInt("fid"),
											rs.getInt("bid"),
											rs.getString("origin_name"),
											rs.getString("change_name"),
											rs.getString("file_path"),
											rs.getDate("upload_Date"),
											rs.getInt("file_Level"),
											rs.getInt("download_Count"),
											rs.getString("status"), 
											rs.getInt("rnum")));
			}
			
			System.out.println("dao selectFList:" + list);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
				close(stmt);
				close(rs);
		}

		return list;
	}
	//조회수증가
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
	
	
	// bid로 조회해서 전체 내용 가져오기 - 디테일뷰
	public Share selectShare(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Share s = null;
		
		String query = prop.getProperty("selectShare");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
		
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				s = new Share(rs.getInt("BID"),		//list에 바로 값넣음 
								rs.getInt("CID"),
								rs.getString("BTITLE"),
								rs.getString("BTYPE"),
								rs.getString("BCONTENT"),
								rs.getInt("BCOUNT"),
								rs.getString("USER_NAME"),
								rs.getDate("CREATE_DATE"),
								rs.getDate("MODIFY_DATE"),
								rs.getString("STATUS"));
			}
			// System.out.println(s);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return s;
	}
	// 사진불러오기
	public ArrayList<Attachment> selectShareThumbnail(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectShareThumbnail");
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, bid);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();	// 중요!!!! nullpointerror 날수있음
			
			while(rs.next()) {
				Attachment at = new Attachment();

				//set방식
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
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}

	public Share selectSFile(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Share s = null;
		
		String query = prop.getProperty("selectSFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
		
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				s = new Share(rs.getInt("BID"),		//list에 바로 값넣음 
							rs.getInt("CID"),
							rs.getString("BTITLE"),
							rs.getString("BTYPE"),
							rs.getString("BCONTENT"),
							rs.getInt("BCOUNT"),
							rs.getString("USER_NAME"),
							rs.getDate("CREATE_DATE"),
							rs.getDate("MODIFY_DATE"),
							rs.getString("STATUS"));
	}
			System.out.println("s: " + s);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return s;
	}

	public ArrayList<Attachment> selectAttachments(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Attachment at = null;
		ArrayList<Attachment> attachments = new ArrayList<Attachment>();
		
		String query = prop.getProperty("selectAttachments");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rs = pstmt.executeQuery();
				
					// 컬렉션(ArrayList)는 반드시 기본생성자로 초기화 해놓고 활용하자!!
				while(rs.next()) {
					at= new Attachment(rs.getInt("fid"),
										rs.getInt("bid"),
										rs.getString("origin_name"),
										rs.getString("change_name"),
										rs.getString("file_path"));
					attachments.add(at);
				}
				
				System.out.println("at: " + at);	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return attachments;
	}

	public int updateShare(Connection conn, Share b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateShare");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1,  b.getbTitle());
			//pstmt.setString(2,  b.getBtype());
			pstmt.setString(2, b.getbContent());
			//pstmt.setInt(4, b.getBlevl());
			pstmt.setInt(3,  b.getbId());
			
			result = pstmt.executeUpdate();
			
			System.out.println("updateShare" + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAttachment(int bid, Connection conn, ArrayList<Attachment> fileList) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateSAttachment");
		
		try {
			for(int i=0; i<fileList.size();i++) {
				Attachment at = fileList.get(i);
				
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, bid);
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setString(4, at.getFilePath());
				// pstmt.setInt(5, at.getFileLevel());
				
				result += pstmt.executeUpdate();
				System.out.println("updateSAtt" + result);
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

	public Attachment selectAttachment(Connection conn, int fid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Attachment at = null;
		
		String query = prop.getProperty("selectSATTACH");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, fid);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				//필요한것만 뽑아와도 된다.
				
				at = new Attachment();
				
				at.setOriginName(rs.getString("origin_name"));
				at.setChangeName(rs.getString("change_name"));
				at.setFilePath(rs.getString("file_path"));
				
				System.out.println(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return at;
		
	}
	// 파일 다운로드시 다운로드 횟수도 증가
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
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	
	
}
