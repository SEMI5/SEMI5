package map.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import map.model.service.TRService;
import map.model.vo.TR_SCORE;

/**
 * Servlet implementation class AjaxLikeUpdate
 */
@WebServlet("/ajaxLikeUpdate.tr")
public class AjaxLikeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxLikeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int likeScore = Integer.valueOf(request.getParameter("likeCnt"));  // 문자열로 넘어왔고, 숫자로 바꿔서 가야함.

		TR_SCORE score = new TR_SCORE(likeScore);
		//TR_list tr = new TR_list(likeScore);
		
		
		int result = new TRService().updateScore(score);
		
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(score, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
