package map.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import map.model.dao.TRDao;
import map.model.vo.TR_SCORE;
import map.model.vo.TR_list;

public class TRService {

	public ArrayList<TR_list> showlist() {
		Connection conn = getConnection();
		ArrayList<TR_list> list = new TRDao().showlist(conn);
		close(conn);
		return list;
	}

	public int insertTR(TR_list tr) {
		Connection conn = getConnection();
		int result = new TRDao().insertTR(conn, tr);
		close(conn);
		return result;
	}

	public int updateScore(TR_SCORE score) {
		Connection conn = getConnection();
		int result = new TRDao().updateScore(conn, score);
		close(conn); 
		System.out.println("서비스 잘됨 " + result);
		return result;
	}



	public int insertScore(TR_SCORE ts) {
		Connection conn = getConnection();
		int result = new TRDao().insertScore(conn, ts);
		close(conn);
		return result;
	}

	public int showScoreList(String trNo) {
		Connection conn = getConnection();
		int result = new TRDao().showScoreList(conn, trNo);
		close(conn);
		return result;
	}

	public int limitLikes(TR_SCORE ts) {
		Connection conn = getConnection();
		int result = new TRDao().limitLikes(conn, ts);
		close(conn);
		return result;
	}


}
