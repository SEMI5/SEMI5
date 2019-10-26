package thumbnail.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.NBoardDao;
import thumbnail.model.vo.Thumbnail;
import thumbnail.model.dao.ThumbnailDao;
import thumbnail.model.vo.Attachment;

public class ThumbnailService {
	
	public ArrayList selectList(int flag) {
		Connection conn = getConnection();
		
		ArrayList list = null;
		
		// BoardDao 메소드 두개를 호출할꺼라 참조변수로 선언하자.
		// 매개변수 i -> flag로 변경
		ThumbnailDao tDao = new ThumbnailDao();
		
		if(flag == 1) {
			// 우선 사진 게시판 리스트 정보를 불러오자
			list = tDao.selectBList(conn);
			
		}else {
			// 사진 리스트도 불러오자
			list = tDao.selectFList(conn);
			
		}
		close(conn);
		return list;
	}
	
	// 사진등록
	public int insertThumbnail(Thumbnail b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		// BoardDao 메소드 두개를 호출하자 (매개변수로 받은 2개를 따로 넘겨줌)
		ThumbnailDao bDao = new ThumbnailDao();
		
		// 사진
		int result1 = bDao.insertThumbnail(conn,b);
		
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
	
	public ArrayList<Attachment> selectThumbnail(int bid) {
		Connection conn = getConnection();
		
		// 불러올 게시물이 여러개라 arraylist
		ArrayList<Attachment> list = new ThumbnailDao().selectThumbnail(conn, bid);
		
		close(conn);
		
		return list;
	}
	
	//카운트증가후 다시 select갔다와서 list에 뿌림
	public Thumbnail selectThumbnailInfo(int bid) {
		Connection conn = getConnection();
		
		// Board board = new BoardDao().selectBoard(conn, bid);
		// BoardDao 메소드 두개를 호출해서 하나는 조회하고 하나는 조회수 증가하는 작업을 해보자
		// 게시판을 클릭하면 조회수가 증가해야하므로
		
		Thumbnail b = new Thumbnail();
		
		ThumbnailDao bDao = new ThumbnailDao();
		int result = bDao.updateCount(conn, bid);
		
		// BoardDao -> updateCount() 메소드에서 result를 받아옴
		// result가 성공을 하면 select를 함 (조회수를 올리고 그 값을 갱신해서 select해옴)
		if(result > 0) {
			commit(conn);
			b = bDao.selectThumbnailInfo(conn,bid);	// 조회수가 증가한 값을 다시 BoardDao로 select하러감
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}
	
	
	// 사진게시판 리스트 갯수 조회용
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new ThumbnailDao().getListCount(conn);
		
		close(conn);
		
		
		return listCount;
	}
	//  사진 게시판 리스트 조회용
	public ArrayList<Thumbnail> selectList(int currentPage, int limit) {
			
		Connection conn = getConnection();
		
		ArrayList<Thumbnail> list = new ThumbnailDao().selectList(conn, currentPage, limit);
		
	
		
		close(conn);
		
		return list;
		
	}
	// 다운로드 처리
	public Attachment selectAttachment(int fid) {
		Connection conn = getConnection();
		
		// Attachment at = new BoardDao().selectAttachment(conn, fid);
		
		// 파일 다운로드시 다운로드 횟수도 증가시켜보자(메소드 두개(하나는 다운할 파일 select, 하나는 해당 파일 다운로드 횟수 증가))
		ThumbnailDao bDao = new ThumbnailDao();
		
		Attachment at = new Attachment();	// return해야해서 
		
		// 다운로드 횟수 증가
		int result = bDao.updateDownloadCount(conn, fid);
		
		if(result > 0 ) {	
			commit(conn);
			// 다운로드할 파일 객체
			at = new ThumbnailDao().selectAttachment(conn, fid);	//조회
		}else {
			rollback(conn);
		}
		
		
		close(conn);
		
		return at;
	}
	
	//수정하기
	public int updateThumbnail(Thumbnail t, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		ThumbnailDao tDao = new ThumbnailDao();
		
		
		int result1 = tDao.updateThumbnail(conn, t);
		int result2 = tDao.updateAttachment(t.getbId(), conn, fileList);
		
		int result = 0;
		
		if(result1>0 && result2>0) {
			commit(conn);
			result =1;
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	//quest
	public int updateThumbnail(Thumbnail t) {
		Connection conn = getConnection();
		
		int result = new ThumbnailDao().updateThumbnail(conn, t);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	//삭제하기
	public int deleteThumbnail(int flag, int bid) {
		Connection conn = getConnection();
		
		int result = 0; 
		if(flag == 2) { // 첨부파일이 있다면 
		
		   int result1 = new ThumbnailDao().deleteThumbail(conn, bid);
 		   int result2 = new  ThumbnailDao().deleteTAttach(conn, bid);

 		   if( result1>0 && result2>=0) {
 			  result =1; 
 		   }
 		   
		}else { //첨부파일이 없다면 
			result = new ThumbnailDao().deleteThumbail(conn, bid);
		}
		

		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
	
	
}
