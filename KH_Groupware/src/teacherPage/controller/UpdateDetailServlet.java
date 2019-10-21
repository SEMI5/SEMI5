package teacherPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.model.service.MemberService;
import member.model.vo.Member;
import teacherPage.model.service.tPageService;

/**
 * Servlet implementation class UpdateDetailServlet
 */
@WebServlet("/updateD.te")
public class UpdateDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		

		int stdNo = Integer.valueOf(request.getParameter("stdNo"));
		String consult = request.getParameter("consult");
		String smoking = request.getParameter("smoking");
		String major = request.getParameter("major");
		String level = request.getParameter("level");
		String exp = request.getParameter("exp");


		HttpSession session = request.getSession();
	
		ArrayList<Member> newList = (ArrayList)session.getAttribute("stdList");
		
		Member std = new Member();
		
		for(int i = 0; i < newList.size() ; i++) {
			if(stdNo == newList.get(i).getUserNo()) {
				newList.get(i).setConsult(consult);
				newList.get(i).setSmoking(smoking);
				newList.get(i).setMajor(major);
				newList.get(i).setStdLv(level);
				newList.get(i).setExp(exp);
				std = newList.get(i);
			}
		}
		
		int result = new tPageService().updateDetailStd(std);
		
		session.setAttribute("stdList", newList);

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
