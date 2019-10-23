package share.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.NBoardDao;
import board.model.vo.Board;
import share.model.dao.SFileDao;
import share.model.vo.Attachment;
import share.model.vo.Share;
import thumbnail.model.dao.ThumbnailDao;



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
	

	public ArrayList selectList(int flag) {
		Connection conn = getConnection();
		
		ArrayList list = null;
		
		// BoardDao 메소드 두개를 호출할꺼라 참조변수로 선언하자.
		// 매개변수 i -> flag로 변경
		SFileDao sDao = new SFileDao();
		
		if(flag == 1) {
			list = sDao.selectBList(conn);
		}else {
			list = sDao.selectFList(conn);
			
		}
		close(conn);
		

		return list;
	}
	
	// 자료실 등록
	public int insertShare(Share s, ArrayList<Attachment> fileList) {
			Connection conn = getConnection();
		
		// SFileDao 메소드 두개를 호출하자 (매개변수로 받은 2개를 따로 넘겨줌)
		SFileDao bDao = new SFileDao();
		
		// 사진
		int result1 = bDao.insertShare(conn,s);
		
		// Attachment(올라간 사진의 정보)
		int result2 = bDao.insertAttachment(conn, fileList);
		
		 // System.out.println(result1);
		 // System.out.println(result2);
		 
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

	public Share selectShare(int bid) {
		Connection conn = getConnection();
		
//		Board board = new BoardDao().selectBoard(conn, bid);
		//BoardDao 메소드 두개를 호출해서 하나는 조회하고 하나는 조회수 늘리는 작업을 해보자
		//게시판을 클릭하면 조회수가 증가해야하므로
		
		Share s = new Share();
		SFileDao sDao = new SFileDao();
		
		int result = sDao.updateCount(conn,bid);
		/* System.out.println("서비스단 조회수:"+result); */
		if(result>0) {
			commit(conn);
			s = sDao.selectShare(conn,bid);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return s;
	}

	public Share selectShare2(int bid) {

		Connection conn = getConnection();
			
		Share share = new SFileDao().selectShare(conn, bid);
		
		close(conn);
		
		return share;
	}

	public ArrayList<Attachment> selectShareThumbnail(int bid) {
		Connection conn = getConnection();
		
		// 불러올 게시물이 여러개라 arraylist
		ArrayList<Attachment> list = new SFileDao().selectShareThumbnail(conn, bid);
		
		close(conn);
		
		return list;
	}


	
	
}

