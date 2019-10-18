package teacherPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Stdlib;

import com.google.gson.Gson;

import member.model.vo.Member;
import teacherPage.model.service.tPageService;
import teacherPage.model.vo.Schedule;

/**
 * Servlet implementation class ShowCalendar
 */
@WebServlet("/showCalendar.te")
public class ShowCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCalendarServlet() {
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
		
		int cid = loginUser.getcId();
		ArrayList<Schedule> scdList = new ArrayList<Schedule>();
		scdList = new tPageService().showCalendar(cid);

		
		HashMap resultHM = null;
		ArrayList<HashMap> result = new ArrayList<HashMap>();
		
		for (int i = 0 ; i < scdList.size() ; i++) {
			resultHM = new HashMap();
			String id = String.valueOf(scdList.get(i).getScdNum());
			System.out.println(id);
			String start = String.valueOf(scdList.get(i).getStrDate());
			String end	= String.valueOf(scdList.get(i).getEndDate());

			
			resultHM.put("id", id);
			resultHM.put("title", scdList.get(i).getScdName());
			resultHM.put("start", start);
			resultHM.put("end", end);
			
			result.add(resultHM);
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
