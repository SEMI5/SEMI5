package thumbnail.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thumbnail.model.service.ThumbnailService;
import thumbnail.model.vo.Thumbnail;

/**
 * Servlet implementation class ThumbnailUpdateViewServlet
 */
@WebServlet("/updateView.th")
public class ThumbnailUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailUpdateViewServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bid = Integer.valueOf(request.getParameter("bid"));
		
		Thumbnail thumbnail = new ThumbnailService().selectThumbnail(bid);
		// selectNotice메소드는 공지사항 상세보기 때 했으니까 다시 만들 필요없이 호출해서 쓰자!
		
		RequestDispatcher view = null;
		
		if(notice != null) {
			view = request.getRequestDispatcher("views/thumbnail/thumbnailUpdateView.jsp");
			request.setAttribute("thumbnail", thumbnail);
		}else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "공지사항 조회 실패");
		}
		
		view.forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
