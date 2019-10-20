package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/update.no")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String title= request.getParameter("title");
			String content= request.getParameter("content");
			int nno = Integer.parseInt(request.getParameter("nno"));	
			
			Notice n = new Notice(); 
			n.setnTitle(title);
			n.setnContent(title);
			n.setnNO(nno);
			
			int result = new NoticeService().updateNotice(n);
			
			RequestDispatcher view =null;
			
			if(result > 0) {
				view =request.getRequestDispatcher("views/notice/noticeDetailView.jsp");
				request.setAttribute("notice", new NoticeService().selectNotice(nno));
			}else {
				view = request.getRequestDispatcher("views/common.errorPage.jsp");
				request.setAttribute("msg", "공지사항 수정 실패");
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
