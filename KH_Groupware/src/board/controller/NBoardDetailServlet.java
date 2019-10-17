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
		
		int bid=Integer.parseInt(request.getParameter("bid"));
		Board board = new NBoardService().selectBoard(bid);
		Board boardPrev = new NBoardService().selectBoard2(bid-1);  // 조회수 올리지 않는 메소드를 새로 작성해서 가져와야함. 
		Board boardNext= new NBoardService().selectBoard2(bid+1);
		
		  System.out.println("서블릿단 board: "+ board);
		  System.out.println("서블릿단 boardPrv: "+ boardPrev);
		  System.out.println("서블릿단 boardNext: "+ boardNext);
		 
		
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
			 request.setAttribute("boardPrev", boardPrev);
			 request.setAttribute("boardNext", boardNext);
		
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
