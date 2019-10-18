package share.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import share.model.dao.SFileDao;
import share.model.vo.Attachment;
import share.model.vo.Share;



public class SFileService {
	
	/*
	 * 게시판 리스트 갯수 조회용
	 */
	public int getListCount() {

		Connection conn = getConnection();
		
		int listCount = new SFileDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/*
	 * 게시판 리스트 조회용
	 */
	public ArrayList<Share> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Share> list = new SFileDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		return list;

	}
	
	// 자료실 등록
	public int insertShare(Share b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		// BoardDao 메소드 두개를 호출하자 (매개변수로 받은 2개를 따로 넘겨줌)
		SFileDao sDao = new SFileDao();
		
		// 자료
		int result1 = sDao.insertShare(conn,b);
		
		// Attachment(올라간 사진의 정보)
		int result2 = sDao.insertAttachment(conn, fileList);
		
		 System.out.println("result1" + result1);
		 System.out.println("result2" +result2);
		 
		int result = 0;
		
		if(result1 > 0 && result2 > 0) {	//둘다성공해야지만
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		
	
		
		close(conn);
		
		return result;
		
		
	}

}

