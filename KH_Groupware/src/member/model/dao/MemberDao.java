package member.model.dao;
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
import member.model.vo.khClass;


public class MemberDao {
	// Properties 객체 생성
	private Properties prop = new Properties();
	
	public MemberDao() {
		// 항상 member-query.properties 값을 불러 올 수 있도록
				// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자
				String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
			
				try {		// new FileReader을 열어준다 . prop에 member-query.properties를 넣어주는
					prop.load(new FileReader(fileName));
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			
	}

	public Member loginMember(Connection conn, Member member) {
		
		System.out.println(member);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Member loginUser = null;
		
		//회원탈퇴시 STATUS='Y'를 UPDATE사용해서 'N'으로 변경
		
		// getProperty를 통해 member-query.properties안에 loginMember의 구문 받아옴
		String query = prop.getProperty("loginMember");
		
		
		try {
			
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			
				 // select 구문이라서 executeQuery() / insert,update,delete 구문은 - executeUpdate()
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {	// resultSet의 결과가 있으면..
				loginUser = new Member(rs.getInt("USER_NO"),           
						rs.getInt("CID"),               
						rs.getString("USER_ID"),        
						rs.getString("USER_PWD"),       
						rs.getString("USER_NAME"),  
						rs.getString("RRN"),
						rs.getString("PHONE"),          
						rs.getString("EMAIL"),          
						rs.getString("ADDRESS"),       			       
						rs.getDate("ENROLL_DATE"),      
						rs.getDate("MODIFY_DATE"),      
						rs.getString("STATUS"),
						rs.getString("LEVEL"),
						rs.getString("MAJOR"),
						rs.getString("SMOKING"),
						rs.getString("SEAT"),
						rs.getString("EXP"),
						rs.getString("CONSULT"),
						rs.getString("APPROVE")
						);                                 
			}                                                          
			                                                               
			                                                             
		} catch (SQLException e) {                                     
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
				// resultSet결과를 Dao객체에 담아 Dao객체를 Service단으로 리턴해준다.
		return loginUser;
		// 다시 Service로 가자!! member 매개변수로 받아온값과 다른 값이 리턴된다.(쿼리를통해)
		
		
	}
	
	// 회원가입 
	public int insertMember(Connection conn, Member member) {

		PreparedStatement pstmt = null;
		
		//반환값이 int라서
		int result = 0;

	
		String query = prop.getProperty("insertMember");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, member.getcId());
			pstmt.setString(2, member.getUserId());
			pstmt.setString(3, member.getUserPwd());
			pstmt.setString(4, member.getUserName());
			pstmt.setString(5, member.getRRN());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.geteMail());
			pstmt.setString(8, member.getAddress());
			
			
			// result 결과는 int형(성공한 행의 갯수)
			result = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
		// MemberService로 돌아가자!
		
	}

	public Member selectMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			// ResultSet을 반환할것이 아니라 member를 반환해야함
			
			if(rs.next()) {	// resultSet의 결과가 있으면..
				member = new Member(rs.getInt("USER_NO"),           
						rs.getInt("CID"),               
						rs.getString("USER_ID"),        
						rs.getString("USER_PWD"),       
						rs.getString("USER_NAME"), 
						rs.getString("RRN"),
						rs.getString("PHONE"),          
						rs.getString("EMAIL"),          
						rs.getString("ADDRESS"),       			       
						rs.getDate("ENROLL_DATE"),      
						rs.getDate("MODIFY_DATE"),      
						rs.getString("STATUS"),
						rs.getString("LEVEL"),
						rs.getString("MAJOR"),
						rs.getString("SMOKING"),
						rs.getString("SEAT"),
						rs.getString("EXP"),
						rs.getString("CONSULT"),
						rs.getString("APPROVE")
						); 
			}
			
		} catch (SQLException e) {	
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
	
		return member;
	}

	public int updateMember(Connection conn, Member member) {
		
		PreparedStatement pstmt = null;
		
		//반환값이 int라서
		int result = 0;
			// SEQ_UNO는 DB에 시퀀스에 확인가능, 기존 컬럼에서 이미 SEQ_UNO.NEXTVAL 사용 / 마지막 DEFAULT값은 Y (DEFAULT 설정안해주면 null)
		String query = prop.getProperty("updateMember");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getPhone());
			pstmt.setString(2, member.geteMail());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getUserPwd());
			pstmt.setString(5, member.getUserId());

			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;

		//반환값이 int라서
		int result = 0;
			// SEQ_UNO는 DB에 시퀀스에 확인가능, 기존 컬럼에서 이미 SEQ_UNO.NEXTVAL 사용 / 마지막 DEFAULT값은 Y (DEFAULT 설정안해주면 null)
		String query = prop.getProperty("deleteMember");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public ArrayList<khClass> callClass(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<khClass> cList = null;
		
		String query = prop.getProperty("selectClass");
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(query);
			
			cList = new ArrayList<khClass>();
			
			while(rs.next()) {
				
				cList.add(new khClass(rs.getInt("cid"),
						rs.getString("c_NAME"),
						rs.getInt("TID"),
						rs.getInt("PERSONNEL"),
						rs.getDate("STR_DATE"),
						rs.getDate("END_DATE"),
						rs.getString("STATUS")
						));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		
		
		return cList;
	}

	public ArrayList<Member> selectAllStd(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		
		String query = prop.getProperty("selectAllStd");
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				
				memberList.add(new Member(rs.getInt("USER_NO"),           
											rs.getInt("CID"),               
											rs.getString("USER_ID"),        
											rs.getString("USER_PWD"),       
											rs.getString("USER_NAME"), 
											rs.getString("RRN"),
											rs.getString("PHONE"),          
											rs.getString("EMAIL"),          
											rs.getString("ADDRESS"),       			       
											rs.getDate("ENROLL_DATE"),      
											rs.getDate("MODIFY_DATE"),      
											rs.getString("STATUS"),
											rs.getString("LEVEL"),
											rs.getString("MAJOR"),
											rs.getString("SMOKING"),
											rs.getString("SEAT"),
											rs.getString("EXP"),
											rs.getString("CONSULT"),
											rs.getString("APPROVE")
											));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return memberList;
	}

	public int checkOl(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("checkOl");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public String findId(String userName, String email, Connection conn) {
		PreparedStatement pstmt = null;
		String id = null;
		ResultSet rs = null;
		
		
		String query = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				id = rs.getString("user_id");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return id;
	}

	public int findPwd(String userId, String email, String phone, String newPwd, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	
	
	
}
