package thumbnail.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thumbnail.model.service.ThumbnailService;
import thumbnail.model.vo.Thumbnail;

/**
 * Servlet implementation class ThumbnailLikeServlet
 */
@WebServlet("/like.th")
public class ThumbnailLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailLikeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* int like = Integer.valueOf(request.getParameter("like")); */
		
		/*
		 * int bid = Integer.parseInt(request.getParameter("bid"));
		 * 
		 * ThumbnailService bService = new ThumbnailService(); int result =
		 * bService.updatelikeThumbnail(bid);
		 * 
		 * response.getWriter().println(result);
		 */
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
