package studentPage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import studentPage.model.dao.sPageDao;
import studentPage.model.vo.AppStudy;
import studentPage.model.vo.Study;

public class sPageService {

	public int openStudy(Study st) {
		Connection conn = getConnection();
		
		int result = new sPageDao().openStudy(conn, st);
		
		if(result >= 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Study> showStudy(int cid) {
		Connection conn =  getConnection();
		
		
		ArrayList<Study> stList = new sPageDao().showStudy(conn, cid);
		
		if(stList != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return stList;
	}

	public ArrayList<AppStudy> showAppStudy(int cid) {
		Connection conn =  getConnection();
		
		
		ArrayList<AppStudy> asList = new sPageDao().showAppStudy(conn, cid);
		
		if(asList != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return asList;
	}

	public int appStudy(AppStudy as) {
		Connection conn = getConnection();
		
		int result = new sPageDao().appStudy(conn, as);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteAS(int userNo, int stNo) {
		Connection conn = getConnection();
		
		int result = new sPageDao().delAS(conn, userNo, stNo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteStudy(int stNo) {
		Connection conn = getConnection();
		
		int result = new sPageDao().delStudy(conn, stNo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int modStudy(Study st) {
		Connection conn = getConnection();
		
		int result = new sPageDao().modStudy(conn, st);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
