package thumbnail.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thumbnail.model.service.ThumbnailService;
import thumbnail.model.vo.Attachment;
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
		
		/*
		 * ArrayList<Attachment> thumbnail = new
		 * ThumbnailService().selectThumbnail(bid); // selectNotice메소드는 공지사항 상세보기 때 했으니까
		 * 다시 만들 필요없이 호출해서 쓰자!
		 */		
		
		// BoardService의 2개의 메소드를 호출할거다. 그러므로 참조변수로 만들자
				ThumbnailService bService = new ThumbnailService();
				
		// 1. 해당 게시판 정보 조회!
		Thumbnail thumbnail = bService.selectThumbnailInfo(bid);
									// selectBoard(bid) 이미 구현해놈
				
		//System.out.println("thumbnail : " + thumbnail);
				
		// 2. 해당 게시판의 사진들 리스트 조회!
		ArrayList<Attachment> fileList = bService.selectThumbnail(bid);
		
		
		RequestDispatcher view = null;
		
		if(thumbnail != null) {
			request.setAttribute("thumbnail", thumbnail);
			request.setAttribute("fileList", fileList);
			view = request.getRequestDispatcher("views/thumbnail/thumbnailUpdateView.jsp");
			
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
