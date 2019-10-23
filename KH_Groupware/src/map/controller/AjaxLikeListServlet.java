package map.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import map.model.service.TRService;
import map.model.vo.TR_SCORE;
import map.model.vo.TR_list;

/**
 * Servlet implementation class AjaxLikeListServlet
 */
@WebServlet("/ajaxLikeList.tr")
public class AjaxLikeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxLikeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ArrayList<TR_SCORE> likeCount = new TRService().showScoreList();
		
         String trNo = request.getParameter("trlist");
		 int result  = new TRService().showScoreList(trNo);
		
		 //System.out.println(trNo+"      "+result);
		
		
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(result, response.getWriter());
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
