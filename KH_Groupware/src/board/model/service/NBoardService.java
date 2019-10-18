package board.model.service;

//Service클래스 처음 만들면 이거 먼저!!
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.NBoardDao;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Reply;

public class NBoardService {

	/*
	 * 게시판 리스트 갯수 조회용
	 */
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new NBoardDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	
	public int getListCount(String type, String searchWord) {
		Connection conn = getConnection();
		
		int listCount = new NBoardDao().getListCount(conn, type, searchWord);
		
		close(conn);
		
		return listCount;

	}

	
	
	/*
	 * 게시판 리스트 조회용
	 */
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new NBoardDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> selectList(String type, String searchWord, int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new NBoardDao().selectList(type, searchWord, conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	
	

	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new NBoardDao().insertBoard(conn, b);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
	public int insertNBoard(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		NBoardDao bDao = new NBoardDao();
		
		int result1 = bDao.insertBoard(conn, b);
		int result2 = bDao.insertAttachment(conn, fileList);
		
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
	
	
	
	public Board selectBoard(int bid) {
		Connection conn = getConnection();
		
//		Board board = new BoardDao().selectBoard(conn, bid);
		//BoardDao 메소드 두개를 호출해서 하나는 조회하고 하나는 조회수 늘리는 작업을 해보자
		//게시판을 클릭하면 조회수가 증가해야하므로
		
		Board b = new Board();
		NBoardDao bDao = new NBoardDao();
		int result = bDao.updateCount(conn,bid);
		/* System.out.println("서비스단 조회수:"+result); */
		if(result>0) {
			commit(conn);
			b=bDao.selectBoard(conn,bid);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}

	public Board selectBoard2(int bid) { // 조회수 올리지 않고 보드 객체 가져옴 ( 이전글, 다음글 보여줄때 쓰려고) 
	
		Connection conn = getConnection();
			
		Board board = new NBoardDao().selectBoard(conn, bid);
		
		close(conn);
		
		return board;
	}

	
	public ArrayList selectList(int flag) {
		Connection conn = getConnection();
		ArrayList list = null;
		
		
		// BoardDao 메소드 두개를 호출할꺼라 참조변수로 선언하자.
		NBoardDao bDao = new NBoardDao();
		
		if(flag ==1) {
			list = bDao.selectBList(conn);
		}else {
			list = bDao.selectFList(conn);
		}
		
		close(conn);
		
		return list;
	}

	public int insertThumbnail(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		// BoardDao 메소드 두개를 호출하자
		NBoardDao bDao = new NBoardDao();
		
		int result1 = bDao.insertThBoard(conn,b);
		int result2 = bDao.insertAttachment(conn,fileList);
		
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

	public ArrayList<Attachment> selectThumbnail(int bid) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new NBoardDao().selectThumbnail(conn,bid);
		
		close(conn);
		
		return list;
	}

	public Attachment selectAttachment(int fid) {
		Connection conn = getConnection();
		
//		Attachment at = new BoardDao().selectAttachment(conn,fid);
		
		// 파일 다운로드시 다운로드 횟수도 증가시켜보자(메소드 두개(하나는 다운할 파일 select, 하나는 해당 파일 다운로드 횟수 증가))
		NBoardDao bDao = new NBoardDao();
		Attachment at = new Attachment();
		
		// 다운로드 횟수 증가
		int result = bDao.updateDownloadCount(conn,fid);
		
		if(result>0) {
			commit(conn);
			// 다운로드할 파일 객체
			at = new NBoardDao().selectAttachment(conn,fid);
		}else {
			rollback(conn);
		}
		
		close(conn);

		return at;
	}

	public ArrayList<Reply> selectReplyList(int bid) {
		Connection conn = getConnection();
		
		ArrayList<Reply> rlist = new NBoardDao().selectReplyList(conn,bid);
		
		
		close(conn);
		
		return rlist;
	}

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		
		// 우리가 insert 작업을 하면 executeUpdate를 해야 하므로 무조건 int형이 넘어온다.
		// 그래서 성공하고 나서 다시 화면에 뿌려줄 해당 게시글 댓글 리스트를 한번 더 DB를 가서 자겨오자.
		NBoardDao bDao = new NBoardDao();
		
		int result = bDao.insertReply(conn, r);
		
		ArrayList<Reply> rlist = null;
		
		if(result > 0) {
			commit(conn);
			rlist = bDao.selectReplyList(conn, r.getRefBid());
		}else {
			rollback(conn);
			close(conn);
		}
		
		return rlist;
	}



	




	


}
