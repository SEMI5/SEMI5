package studentPage.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import studentPage.model.service.sPageService;
import studentPage.model.vo.AppStudy;

/**
 * Servlet implementation class AppStudyServlet
 */
@WebServlet("/appStudy.st")
public class AppStudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppStudyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		int userNo = Integer.valueOf(request.getParameter("userNo"));
		int stNo = Integer.valueOf(request.getParameter("stNo"));
		Date appDate = Date.valueOf(request.getParameter("appDate"));
		
		AppStudy as = new AppStudy(userNo, stNo, appDate);
		
		int result = new sPageService().appStudy(as);
		
		if(result == 1) {
			new Gson().toJson(result, response.getWriter());
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
