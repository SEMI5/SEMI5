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

import member.model.dao.MemberDao;
import member.model.service.MemberService;
import member.model.vo.Member;
import teacherPage.model.service.tPageService;

/**
 * Servlet implementation class UpdateSeatSurvlet
 */
@WebServlet("/updateSeat.te")
public class UpdateSeatSurvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSeatSurvlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		String seatMap = request.getParameter("seatMap");
		
		String[]  seatMapping = seatMap.split(",");
		
		int result = 0;
		
		
		result = new tPageService().updateSeat(seatMapping);
	
		if(result > 0) {
			HttpSession session = request.getSession();

			System.out.println(result);
			
			ArrayList<Member> memberList = new MemberService().selectAllStd();
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			// 강사 자신을 제외한 학생들 리스트를 다시 만듭니다.
			ArrayList<Member> stdList = new ArrayList();
			
			for(int i = 0 ; i<memberList.size() ; i++){
				if(memberList.get(i).getUserNo()<100000 && memberList.get(i).getcId() == loginUser.getcId()){
					stdList.add(memberList.get(i));
				}		
				
			}

			session.setAttribute("stdList", stdList);
			
			new Gson().toJson(null, response.getWriter());			
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
