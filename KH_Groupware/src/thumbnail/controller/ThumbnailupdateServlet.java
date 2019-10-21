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
 * Servlet implementation class updateThumbnailServlet
 */
@WebServlet("/update.th")
public class ThumbnailupdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailupdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int bid = Integer.parseInt(request.getParameter("bid"));	//getParameter는 String형이라 필요하면 변환작업해야함
			
			//setter
			Thumbnail t = new Thumbnail();
			t.setbTitle(title);
			t.setbContent(content);
			t.setbId(bid);
			
			int result = new ThumbnailService().updateThumbnail(t);
			
			//System.out.println(result);
				
			RequestDispatcher view = null;
			if(result > 0) {
				view = request.getRequestDispatcher("views/thumbnail/thumbnailDetailView.jsp");
				// 내가 수정한 글번호를 가지고 다시 DB에 가서 갱신된 select값을 가지고 돌아가는데 noticeDetailView로 돌아간다. 
				// NoticeDetailServlet에 있는 new NoticeService().selectNotice(nno);
				request.setAttribute("thumbnail", new ThumbnailService().selectThumbnail(bid));		
			} else {
				view = request.getRequestDispatcher("views/common/errorPage.jsp");
				request.setAttribute("msg", "공지사항 수정 실패");
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
