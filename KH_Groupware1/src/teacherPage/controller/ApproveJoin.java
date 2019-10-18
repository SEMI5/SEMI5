package teacherPage.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ApproveJoin
 */
@WebServlet("/approve.te")
public class ApproveJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveJoin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		int userNo = Integer.valueOf(request.getParameter("userNo"));
		
		int result = new tPageService().appJoin(userNo);

		
		Member member = new MemberService().selectMember(request.getParameter("userId"));
		
		System.out.println(result);
		
		HttpSession session = request.getSession();
		
		System.out.println(session.getAttribute("stdList"));
		
		ArrayList<Member> newList = (ArrayList)session.getAttribute("stdList");
		
		for(int i  = 0 ; i<newList.size() ; i++) {
			if(newList.get(i).getUserNo() == userNo) {
				newList.set(i, member);
				System.out.println(newList.get(i).getApprove());
			}
		}
		
		session.setAttribute("stdList", newList);

		System.out.println(session.getAttribute("stdList"));
		
		new Gson().toJson(newList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
