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
	public ArrayList<Attachment> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new SFileDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		return list;

	}
	
	//게시판 정보 와 자료 불러오기
	public ArrayList selectList() {
		Connection conn = getConnection();
		
		ArrayList list = null;
		
		// BoardDao 메소드 두개를 호출할꺼라 참조변수로 선언하자.
		// 매개변수 i -> flag로 변경
		SFileDao sDao = new SFileDao();
		
		list = sDao.selectFList(conn); 	// 자료불러오기
		
		
		
		
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

	public ArrayList<Attachment> selectShare(int bid) {
		Connection conn = getConnection();
		
		// 불러올 게시물이 여러개라 arraylist
		ArrayList<Attachment> list = new SFileDao().selectShareThumbnail(conn, bid);
		
		close(conn);
		
		return list;
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


	public static Share selectSFile(int bid) {
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
			s = sDao.selectSFile(conn,bid);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return s;
	}

	public static ArrayList<Attachment> selectAttachments(int bid) {
		Connection conn = getConnection();		
		ArrayList<Attachment> attachments = new SFileDao().selectAttachments(conn,bid);
		
		close(conn);
		
		return attachments; 
	}

	
	// 다운로드 처리
	public Attachment selectAttachment(int fid) {
		Connection conn = getConnection();
		
		// Attachment at = new BoardDao().selectAttachment(conn, fid);
		
		// 파일 다운로드시 다운로드 횟수도 증가시켜보자(메소드 두개(하나는 다운할 파일 select, 하나는 해당 파일 다운로드 횟수 증가))
		SFileDao bDao = new SFileDao();
		
		Attachment at = new Attachment();	// return해야해서 
		
		// 다운로드 횟수 증가
		int result = bDao.updateDownloadCount(conn, fid);
		System.out.println("s" +result);
		if(result > 0 ) {	
			commit(conn);
			// 다운로드할 파일 객체
			at = new SFileDao().selectAttachment(conn, fid);	//조회
		}else {
			rollback(conn);
		}
		
		
		close(conn);
		
		return at;
	}

	
	
	
	public int insertSFile(ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		// BoardDao 메소드 두개를 호출하자 (매개변수로 받은 2개를 따로 넘겨줌)
		SFileDao bDao = new SFileDao();
		
		
		int result2 = bDao.insertAttachment(conn, fileList);
		
		// System.out.println(result1);
		
		int result = 0;
		
		if(result2 > 0) {	//둘다성공해야지만
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
	
	
}

