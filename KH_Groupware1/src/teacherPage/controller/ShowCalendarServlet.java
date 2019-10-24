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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");

		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");

		int cid = loginUser.getcId();

		ArrayList<Member> stdList = (ArrayList) session.getAttribute("stdList");

		ArrayList<Schedule> scdList = new ArrayList<Schedule>();

		scdList = new tPageService().showCalendar(cid);

		HashMap resultHM = null;
		ArrayList<HashMap> result = new ArrayList<HashMap>();

		for (int i = 0; i < scdList.size(); i++) {
			resultHM = new HashMap();
			String id = String.valueOf(scdList.get(i).getScdNum());
			String start = String.valueOf(scdList.get(i).getStrDate());
			String end = String.valueOf(scdList.get(i).getEndDate());
			String userNum = String.valueOf(scdList.get(i).getUserNum());
			String type = scdList.get(i).getScdType();
			String userName = "알 수 없음";

			resultHM.put("id", id);

			resultHM.put("start", start);
			resultHM.put("end", end);
			resultHM.put("userNum", userNum);
			resultHM.put("type", type);

			if (loginUser.getUserNo() == scdList.get(i).getUserNum()) {
				userName = loginUser.getUserName();
				resultHM.put("userName", userName);
			}

			if (loginUser.getUserNo() > 100000) {

				if (type.equals("SCD")) {
					resultHM.put("title", scdList.get(i).getScdName());
					resultHM.put("editable", "true");
					resultHM.put("color", "black");
					resultHM.put("textColor", "white");
				}

				if (type.equals("V_Y")) {
					resultHM.put("title", userName + " : 휴가승인");
					resultHM.put("color", "blue");
				}

				if (type.equals("V_W")) {
					resultHM.put("title", userName + " : 승인대기중");
					resultHM.put("color", "grey");
				}

				if (type.equals("V_N")) {
					resultHM.put("title", userName + " : 휴가불승인");
					resultHM.put("color", "red");
				}

				result.add(resultHM);
			} else {

				if (type.equals("SCD")) {
					resultHM.put("title", scdList.get(i).getScdName());
					resultHM.put("color", "black");
					resultHM.put("textColor", "white");
					result.add(resultHM);
				}

				if (type.equals("V_Y") && loginUser.getUserNo() == scdList.get(i).getUserNum()) {
					resultHM.put("title", "휴가 승인");
					resultHM.put("color", "blue");
					result.add(resultHM);
				}

				if (type.equals("V_W") && loginUser.getUserNo() == scdList.get(i).getUserNum()) {
					resultHM.put("title", "승인 대기중");
					resultHM.put("color", "grey");
					resultHM.put("editable", "true");

					result.add(resultHM);
				}

				if (type.equals("V_N") && loginUser.getUserNo() == scdList.get(i).getUserNum()) {
					resultHM.put("title", "휴가 불승인");
					resultHM.put("color", "red");
					result.add(resultHM);
				}
			}

		}

		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
