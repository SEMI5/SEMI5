package map.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import map.model.dao.TRDao;
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


}
