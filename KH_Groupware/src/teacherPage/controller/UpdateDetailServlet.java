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
		
		Member member = new Member(stdNo, level, major, smoking, exp, consult);
		
		
		int result = new tPageService().updateDetailStd(member);
		
		
		member = new MemberService().selectMember(request.getParameter("userId"));
		
		HttpSession session = request.getSession();
		
		ArrayList<Member> newList = (ArrayList)session.getAttribute("stdList");
	
		
		for(int i = 0 ; i < newList.size() ; i++) {
			if(stdNo == newList.get(i).getUserNo()) {
				newList.set(i, member);
			}
		}
		
		session.setAttribute("stdList", newList);

		new Gson().toJson(member, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
