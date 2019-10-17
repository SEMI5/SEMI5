package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import member.model.vo.khClass;
import teacherPage.model.dao.tPageDao;

public class MemberService {
	public static int LOGIN_OK = 1;
	public static int WRONG_PASSWORD = 0;
	public static int ID_NOT_EXIST = -1;
	
	public MemberService() {
		
	}
	
	// 로그인
	public Member loginMember(Member member) {
		Connection conn = getConnection();
		// Dao에 conn과 member객체 같이 넘김
		Member loginUser = new MemberDao().loginMember(conn,member);
		
		close(conn);
		return loginUser;
	}

	// 회원가입 
	public int insertMember(Member member) {
		// Connection객체 생성
		Connection conn = getConnection();
				
		int result = new MemberDao().insertMember(conn, member);
				
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		close(conn);
				
		return result;
	}

	// 회원 정보 불러옴
	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member member = new MemberDao().selectMember(conn, userId);
		
		close(conn);	
		
		return member;
		
		
	}
	
	// 회원정보 수정
	public int updateMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 회원탙퇴 
	public int deleteMember(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<khClass> callClass() {
		Connection conn = getConnection();
		
		ArrayList<khClass> cList = new MemberDao().callClass(conn);
		
		if(cList != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return cList;
	}

	public ArrayList<Member> selectAllStd() {
		Connection conn = getConnection();
		
		ArrayList<Member> memberList = new MemberDao().selectAllStd(conn);
		
		if(memberList != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return memberList;
	}

}
