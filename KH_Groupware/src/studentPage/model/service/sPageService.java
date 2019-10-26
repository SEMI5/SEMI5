package studentPage.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import studentPage.model.vo.Study;
import studentPage.model.dao.sPageDao;

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

	public ArrayList<Study> showAppStudy(int cid) {
Connection conn =  getConnection();
		
		
		ArrayList<Study> asList = new sPageDao().showAppStudy(conn, cid);
		
		if(asList != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return asList;
	}

}
