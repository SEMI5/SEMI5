package board.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.NBoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class DeleteNBoardServlet
 */
@WebServlet("/Ndelete.bo")
public class DeleteNBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int bid = Integer.valueOf(request.getParameter("bid"));
		
		
		NBoardService Nbservice = new NBoardService();
		
		Board b= Nbservice.selectBoard(bid);
		
		int result = 0; 
		if (b.getBtype().equals("2")){
			result = Nbservice.deleteNBoard(2, bid); // FLAG  첨부파일 있을때
		}else {
			result = Nbservice.deleteNBoard(1, bid); // FLAG  첨부파일 없을때
		}
		

	 	if( result > 0) {
			 response.sendRedirect("Nlist.bo?currentPage=1");
	 	}else { 
			 
			 request.setAttribute("msg", "게시판 삭제 실패!");
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
