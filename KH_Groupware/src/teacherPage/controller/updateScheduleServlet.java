package teacherPage.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import teacherPage.model.service.tPageService;
import teacherPage.model.vo.Schedule;

/**
 * Servlet implementation class updateScheduleServlet
 */
@WebServlet("/updateSchedule.te")
public class updateScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		int result = 0;
		
		int scdNo = Integer.valueOf(request.getParameter("scdNo"));
		String type = request.getParameter("type");
		
		System.out.println(scdNo+"   "+type);
		
		
		if(type.equals("modify")) {
			Date strDate = null, endDate = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String sdate = request.getParameter("strDate");
			strDate = Date.valueOf(sdate);
			String ndate = request.getParameter("endDate");
			endDate = Date.valueOf(ndate);
			
			Schedule scd = new Schedule(scdNo, strDate, endDate);
			result = new tPageService().modifySchedule(scd);

		}
		if(type.equals("modifyOneday")) {
			Date strDate = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String sdate = request.getParameter("strDate");
			strDate = Date.valueOf(sdate);

			Schedule scd = new Schedule(scdNo, strDate, null);
			result = new tPageService().modifySchedule(scd);

		}
		if(type.equals("delete")) {
			result = new tPageService().deleteSchedule(scdNo);
		}
		
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
