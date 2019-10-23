package thumbnail.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.NBoardService;
import board.model.vo.Board;
import thumbnail.model.service.ThumbnailService;
import thumbnail.model.vo.Thumbnail;

/**
 * Servlet implementation class ThumbnailDelete
 */
@WebServlet("/tDelete.th")
public class ThumbnailDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailDeleteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 삭제시는 게시글 번호 정보만 받아오면됨
			int bid = Integer.valueOf(request.getParameter("bid"));
			
			
			ThumbnailService tbservice = new ThumbnailService();
			
			Thumbnail t= tbservice.selectThumbnailInfo(bid);

			
				int result = 0; 
				if (t.getBtype().equals("2")){
					result = tbservice.deleteThumbnail(2, bid);
					// FLAG  첨부파일 있을때
				}else {
					result = tbservice.deleteThumbnail(1, bid); // FLAG  첨부파일 없을때
				}
				
				if(result > 0) {
					response.sendRedirect("list.th");	//DB로 부터 갱신된 값을 불러와서 list.no로 넘어간다.
					
				} else {
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					request.setAttribute("msg", "사진게시판 삭제 실패!");
					view.forward(request, response);
				}
				
				
				
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
