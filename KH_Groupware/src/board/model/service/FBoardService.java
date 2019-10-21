package board.model.service;

//Service클래스 처음 만들면 이거 먼저!!
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.FBoardDao;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Reply;

public class FBoardService {

	/*
	 * 게시판 리스트 갯수 조회용
	 */
	public int getListCount(int cid) {
		Connection conn = getConnection();
		
		int listCount = new FBoardDao().getListCount(cid, conn);
		
		close(conn);
		
		return listCount;
	}

	
	public int getListCount(int cid, String type, String searchWord) {
		Connection conn = getConnection();
		
		int listCount = new FBoardDao().getListCount(cid, conn, type, searchWord);
		
		close(conn);
		
		return listCount;

	}

	
	
	/*
	 * 게시판 리스트 조회용
	 */
	public ArrayList selectList(int cid, int flag, int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList list = null;
		
		FBoardDao NbDao = new FBoardDao();
		
		if(flag ==1) {
			list = NbDao.selectBList(cid, conn, currentPage, limit);
		}else {
			list = NbDao.selectAttachList(cid, conn, currentPage, limit);
		}
		
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> selectList(int cid, String type, String searchWord, int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new FBoardDao().selectList(cid, type, searchWord, conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	
	

	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new FBoardDao().insertBoard(conn, b);
		
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
		
		FBoardDao bDao = new FBoardDao();
		
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
		FBoardDao bDao = new FBoardDao();
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

	public Board selectBoard2(int bid) { // 조회수 올리지 않고 보드 객체 가져옴 ( 이전글, 다음글 보여줄때 쓰려고).... 근데 망함 rnum 으로 가져올거임  
	
		Connection conn = getConnection();
			
		Board board = new FBoardDao().selectBoard(conn, bid);
		
		close(conn);
		
		return board;
	}

	

	public int insertThumbnail(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		// BoardDao 메소드 두개를 호출하자
		FBoardDao bDao = new FBoardDao();
		
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


	public Attachment selectAttachment(int fid) {
		Connection conn = getConnection();
		
//		Attachment at = new BoardDao().selectAttachment(conn,fid);
		
		// 파일 다운로드시 다운로드 횟수도 증가시켜보자(메소드 두개(하나는 다운할 파일 select, 하나는 해당 파일 다운로드 횟수 증가))
		FBoardDao bDao = new FBoardDao();
		Attachment at = new Attachment();
		
		// 다운로드 횟수 증가
		int result = bDao.updateDownloadCount(conn,fid);
		
		if(result>0) {
			commit(conn);
			// 다운로드할 파일 객체
			at = new FBoardDao().selectAttachment(conn,fid);
		}else {
			rollback(conn);
		}
		
		close(conn);

		return at;
	}
	
	public ArrayList<Attachment> selectAttachments(int bid) {
		Connection conn = getConnection();		
		ArrayList<Attachment> attachments = new FBoardDao().selectAttachments(conn,bid);
		
		close(conn);
		
		return attachments; 
	}
	
	public ArrayList<Attachment> selectAttachments(ArrayList<Board> list) {
		Connection conn = getConnection();		
		ArrayList<Attachment> attachments = new FBoardDao().selectAttachments(conn,list);
		
		close(conn);
		
		return attachments; 
	}

	
	

	public ArrayList<Reply> selectReplyList(int bid) {
		Connection conn = getConnection();
		
		ArrayList<Reply> rlist = new FBoardDao().selectReplyList(conn,bid);
		
		
		close(conn);
		
		return rlist;
	}

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		
		// 우리가 insert 작업을 하면 executeUpdate를 해야 하므로 무조건 int형이 넘어온다.
		// 그래서 성공하고 나서 다시 화면에 뿌려줄 해당 게시글 댓글 리스트를 한번 더 DB를 가서 자겨오자.
		FBoardDao bDao = new FBoardDao();
		
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


	public int selectRnum(int cid, int bid) {
		Connection conn = getConnection();
		
		int nowRnum = new FBoardDao().selectRnum(cid, conn, bid);
		
		close(conn);
		
		return nowRnum;

	}


	public Board selectBoardAsRnum(int cid, int rnum) {
		
		Connection conn = getConnection();
		Board board = new FBoardDao().selectBoardAsRnum(cid, conn, rnum);
	
		close(conn);
		
		return board;
	}


	public int deleteNBoard(int flag, int bid) {
		Connection conn = getConnection();
		
		int result = 0; 
		if(flag == 2) { // 첨부파일이 있다면 
		
		   int result1 = new FBoardDao().deleteFBoard(conn, bid);
 		   int result2 = new  FBoardDao().deleteNAttach(conn, bid);

 		   if( result1>0 && result2>=0) {
 			  result =1; 
 		   }
 		   
		}else { //첨부파일이 없다면 
			result = new FBoardDao().deleteFBoard(conn, bid);
		}
		

		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


	public int deleteAttachAsFid(int fid) {
		Connection conn = getConnection();
		int result = new FBoardDao().deleteAttachAsFid(conn, fid);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result; 
	}


	public int updateBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new FBoardDao().updateBoard(conn, b);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


	public int updateNBoard(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		FBoardDao bDao = new FBoardDao();
		
		int result1 = bDao.updateBoard(conn, b);
		int result2 = bDao.updateAttachment(b.getbId(), conn, fileList);
		
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
}




