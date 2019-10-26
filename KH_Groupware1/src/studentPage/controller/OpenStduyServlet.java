package studentPage.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import studentPage.model.service.sPageService;
import studentPage.model.vo.Study;
import sun.java2d.pipe.SpanShapeRenderer.Simple;

/**
 * Servlet implementation class OpenStduyServlet
 */
@WebServlet("/openStduy.st")
public class OpenStduyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OpenStduyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		int userNo = Integer.valueOf(request.getParameter("userNo"));
		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String time = request.getParameter("time");
		
		 Date date = Date.valueOf(request.getParameter("date"));
		 
		
		Study st = new Study(userNo, title,location, time, date);
		
		int result  = new sPageService().openStudy(st);
		

		
		if(result  == 1) {
			new Gson().toJson(st, response.getWriter());
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
