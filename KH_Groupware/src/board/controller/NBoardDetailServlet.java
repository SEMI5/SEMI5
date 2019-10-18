package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.NBoardService;
import board.model.vo.Board;
import board.model.vo.Reply;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/Ndetail.bo")
public class NBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NBoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bid = Integer.valueOf(request.getParameter("bid"));

		NBoardService nBoardService= new NBoardService( ); 
		int nowRnum = nBoardService.selectRnum(bid);
		Board board = nBoardService.selectBoard(bid); // 현재글은 조회수를 올려야 하니 rnum으로 조회x
		Board prevBoard = nBoardService.selectBoardAsRnum(nowRnum+1); 
		Board nextBoard = nBoardService.selectBoardAsRnum(nowRnum-1);
		
		
		System.out.println("디테일써블릿 nowRnum: " + nowRnum);
		System.out.println("현재글: " + board);
		System.out.println("이전글: " + prevBoard);
		System.out.println("다음글: " + nextBoard);
		
				// --------------------이 부분은 ajax 기능으로 댓글 기능을 추가하기 위해 작성하는 부분 ------------------- 
		// 우선 댓글 달기 기능을 위해서 Reply vo 클래스를 만들어 주고 오자.
		/*
		 * ArrayList<Reply> rlist = new NBoardService().selectReplyList(bid);
		 * System.out.println(rlist);
		 * 
		 * //---------------------------------------------------------------------------
		 */ 
		 
		 if(board != null) { 
			 request.setAttribute("board", board);
			 request.setAttribute("prevBoard", prevBoard);
			 request.setAttribute("nextBoard", nextBoard);
		
			  // --------------------이 부분은 ajax 기능으로 댓글 기능을 추가하기 위해 작성하는 부분
			  //------------------- request.setAttribute("rlist", rlist); //
			  //boardDetailView.jsp로 가서 댓글리스트가 보여지도록 화면단 작성하자
			 request.getRequestDispatcher("views/board/nBoardDetailView.jsp").forward(request, response); 
		  }else { 
			  request.setAttribute("msg", "게사판 상세조회 실패!");
			  request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response); 
		  }
		
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
