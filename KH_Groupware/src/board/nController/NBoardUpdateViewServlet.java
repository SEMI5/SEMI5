package board.nController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.NBoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;

/**
 * Servlet implementation class NoticeUpdateViewServlet
 */
@WebServlet("/NupdateView.bo")
public class NBoardUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NBoardUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bid= Integer.valueOf(request.getParameter("bid"));
		
		NBoardService NboardService = new NBoardService();
		
		Board board = NboardService.selectBoard(bid);
		ArrayList<Attachment> flist = NboardService.selectAttachments(bid);
		
		RequestDispatcher view= null; 
		if(board != null) {
			view=request.getRequestDispatcher("views/board/nBoardUpdateView.jsp");
			request.setAttribute("board", board);
			request.setAttribute("flist", flist);
		}else {
			view=request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "공지사항 수정조회를 실패하였습니다.");
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
