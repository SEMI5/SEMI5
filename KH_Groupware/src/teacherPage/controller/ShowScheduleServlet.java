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

import com.google.gson.Gson;

import member.model.vo.Member;
import teacherPage.model.service.tPageService;
import teacherPage.model.vo.Schedule;

/**
 * Servlet implementation class ShowScheduleServlet
 */
@WebServlet("/showSchedule.te")
public class ShowScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		HttpSession session = request.getSession();
		
		int stdNum = Integer.valueOf(request.getParameter("stdNum"));
		
		ArrayList<Schedule> scdList = new tPageService().showSchedule(stdNum);
		ArrayList<Member> stdList = (ArrayList)session.getAttribute("stdList");
		
		ArrayList<HashMap> result = new ArrayList<HashMap>();
		
		
		
		for(int i = 0 ; i<scdList.size() ; i++) {
			HashMap resultHM = new HashMap();
			String id = String.valueOf(scdList.get(i).getScdNum());
			String start = String.valueOf(scdList.get(i).getStrDate());
			String userNum = String.valueOf(scdList.get(i).getUserNum());
			String type = scdList.get(i).getScdType();
			String userName = "알 수 없음";
			
			for(int j = 0 ; j < stdList.size() ; j++) {
					if(stdList.get(j).getUserNo() == scdList.get(i).getUserNum()) {
						userName = stdList.get(j).getUserName();
						resultHM.put("userName", userName);
					}
				}
			
			resultHM.put("id", id);
			resultHM.put("start", start);
			resultHM.put("userNum", userNum);
			resultHM.put("type", type);
			resultHM.put("title", scdList.get(i).getScdName());

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
