package thumbnail.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thumbnail.model.service.ThumbnailService;
import thumbnail.model.vo.Attachment;
import thumbnail.model.vo.Thumbnail;

/**
 * Servlet implementation class ThumbnailDetailServlet
 */
@WebServlet("/detail.th")
public class ThumbnailDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailDetailServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.valueOf(request.getParameter("bid"));
		
		// BoardService의 2개의 메소드를 호출할거다. 그러므로 참조변수로 만들자
		ThumbnailService bService = new ThumbnailService();
		
		// 1. 해당 게시판 정보 조회!
		Thumbnail thumbnail = bService.selectThumbnailInfo(bid);
							// selectBoard(bid) 이미 구현해놈
		
		//System.out.println("thumbnail : " + thumbnail);
		
		// 2. 해당 게시판의 사진들 리스트 조회!
		ArrayList<Attachment> fileList = bService.selectThumbnail(bid);
		
		
		if(fileList != null) {
			request.setAttribute("thumbnail", thumbnail);
			request.setAttribute("fileList", fileList);
			request.getRequestDispatcher("views/thumbnail/thumbnailDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "사진 게시판 상세보기 실패!");
			request.getRequestDispatcher("views/coomon/errorPage.jsp").forward(request, response);
		}
		// thumbnailDetailView 만들러 ㄱㄱ
		
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
