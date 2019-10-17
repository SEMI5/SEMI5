package teacherPage.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.model.vo.Member;
import teacherPage.model.service.tPageService;
import teacherPage.model.vo.Schedule;

/**
 * Servlet implementation class UpdateScheduleServlet
 */
@WebServlet("/insertSchedule.te")
public class InsertScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String scdName = request.getParameter("scdName");
		
		Date strDate = null, endDate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sdate = request.getParameter("strDate");
		strDate = Date.valueOf(sdate);
		String ndate = request.getParameter("endDate");
		endDate = Date.valueOf(ndate);
		
		
		
		Schedule scd = new Schedule(loginUser.getcId(), loginUser.getUserNo(), scdName, strDate, endDate);
		System.out.println(scd);
		int result = new tPageService().insertSchedule(scd);
	
		System.out.println(result);
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
