package teacherPage.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import teacherPage.model.dao.tPageDao;
import teacherPage.model.vo.Schedule;

public class tPageService {


	public int updateDetailStd(Member member) {
		Connection conn = getConnection();
		
		int result = new tPageDao().updateDetailStd(conn, member);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int appJoin(int userNo) {
		Connection conn = getConnection();
		
		int result = new tPageDao().appJoin(conn, userNo);
		
		if(result != 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int updateSeat(ArrayList<Member> csList) {
		Connection conn = getConnection();
		
		int result = new tPageDao().updateSeat(conn, csList);

		if(result != 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertSchedule(Schedule scd) {
		Connection conn = getConnection();
		
		int result = new tPageDao().insertSchedule(conn, scd);
		
		if(result != 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

}
