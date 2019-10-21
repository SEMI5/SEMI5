package thumbnail.model.dao;

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


import thumbnail.model.vo.Attachment;
import thumbnail.model.vo.Thumbnail;

import static common.JDBCTemplate.*;


public class ThumbnailDao {
	//전역으로 선언
	Properties prop = new Properties();
	
	public ThumbnailDao() {
		//prop 생성은 기본생성자에서 만들어줌
		String fileName = ThumbnailDao.class.getResource("/sql/thumbnail/thumbnail-query.properties").getPath();
			
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {		
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	
	
	// 사진게시판  -  사진 게시판 리스트 정보를 불러오자
	public ArrayList selectBList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String qeury = prop.getProperty("selectTBLIST");	// (BLIST는 3개를 join한 view에서) Btype이 2인것만 select 
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(qeury);
			list = new ArrayList();	// 노란줄은 제네릭을 안줘서 
			
			
			while(rs.next()) {
				list.add(new Thumbnail(rs.getInt("BID"),		//list에 바로 값넣음 
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
		
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return list;

	}
	
	// 사진게시판 - 사진 리스트도 불러오자
	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;	
		
		ArrayList list = null;
		
		
		String query = prop.getProperty("selectTFList");
									// FILE_LEVEL 우리가 올린사진중에 대표사진
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList();	// 안해주면 null로 나와서 add가 안먹힘
			
			while(rs.next()) {
				list.add(new Attachment(rs.getInt("bid"),
										rs.getString("change_name")));
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
				close(stmt);
				close(rs);
		}

		return list;
	}

	
	public int insertThumbnail(Connection conn, Thumbnail b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertThumbnail");	
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, Integer.valueOf(b.getbWriter()));
			
			result = pstmt.executeUpdate();
			
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
		
		String query = prop.getProperty("insertTATTACH");	
		
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


	public int updateCount(Connection conn, int bid) {
		// 게시판 조회수 증가
		PreparedStatement pstmt = null;
		int result = 0;
				
		String query = prop.getProperty("updateCount");
				
		try {
			pstmt = conn.prepareStatement(query);
					
			pstmt.setInt(1, bid);
					
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	// 이미지 다운로드
		public Attachment selectAttachment(Connection conn, int fid) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			Attachment at = null;
			
			String query = prop.getProperty("selectTATTACH");
			
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
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			
			return at;
			
		}

	
	public Thumbnail selectThumbnailInfo(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Thumbnail b = null;
		
		String query = prop.getProperty("selectThumbnailInfo");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				b = new Thumbnail(rs.getInt("BID"),		//list에 바로 값넣음 
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return b;
	}

	// 사진불러오기
	public ArrayList<Attachment> selectThumbnail(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectThumbnail");
		
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

	// 사진게시판 리스트 갯수 조회용
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


	public ArrayList<Thumbnail> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Thumbnail>list = null;	//값을 받아줄 arraylist
		
		String query = prop.getProperty("selectList");
			// 서브쿼리로 한이유는 정렬을 하고나서 RNUM값을 넣고 보여지게하려고
			// ? 3개는 시작페이지과 끝페이지와 , 타입-일반/사진 
			
		//쿼리문 실행시 조건절에 넣을 변수들(rownum에 대한 조건 시 필요)
		int startRow = (currentPage - 1) * limit + 1;		
		//ex) 2page면 시작 번호가 11번일 것이다.
		int endRow = startRow + limit - 1;
		// 11 + 10 - 1 = 20 
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, 2);		// 1은 게시판 타입을 의미함 -> 1 = 일반게시판, 2=사진게시판
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Thumbnail>();	// 컬렉션(ArrayList)는 반드시 기본 생성자로 초기화 해놓고 활용하자!!! 안하면 nullpointerror 남
			
			while(rs.next()) {
				Thumbnail b = new Thumbnail(rs.getInt("BID"),		//list에 바로 값넣음 
						rs.getInt("CID"),
						rs.getString("BTITLE"),
						rs.getString("BTYPE"),
						rs.getString("BCONTENT"),
						rs.getInt("BCOUNT"),
						rs.getString("USER_NAME"),
						rs.getDate("CREATE_DATE"),
						rs.getDate("MODIFY_DATE"),
						rs.getString("STATUS"));
						
				list.add(b);	//리스트 객체에 담아줌
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
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

	// 수정하기
	public int updateThumbnail(Connection conn, Thumbnail t) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateThumbnail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, t.getbTitle());
			pstmt.setString(2, t.getbContent());
			pstmt.setInt(3, t.getbId());
			
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	/*
	 * public int updatelikeThumbnail(Connection conn, int bid) { PreparedStatement
	 * pstmt = null; int result = 0;
	 * 
	 * String query = prop.getProperty("updatelikeThumbnail");
	 * 
	 * try { pstmt = conn.prepareStatement(query);
	 * 
	 * pstmt.setInt(1, bid);
	 * 
	 * result = pstmt.executeUpdate();
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(pstmt); }
	 * 
	 * return result; }
	 */

}
