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
		
		String type = request.getParameter("type");
		
		HttpSession session = request.getSession();
		
		ArrayList<Member> stdList = (ArrayList)session.getAttribute("stdList");
		
		ArrayList<Member> csList = (ArrayList)session.getAttribute("changeSeatList");

		switch(type){
		case "move":
			int stdNo = Integer.valueOf(request.getParameter("stdNo"));

			String seatNo = request.getParameter("seatNo");

			
			csList.get(stdNo-1).setSeat(seatNo);
			session.setAttribute("changeSeatList", csList);
			
			csList = (ArrayList)session.getAttribute("changeSeatList");

			
			break;
			
		case "reset":
			/*
			 * for(int i = 0 ; i < stdList.size() ; i++) { if(stdList.get(i).getUserNo() ==
			 * stdNo) { stdList.get(i).setSeat(null); } }
			 */
			break;
			
		case "save":
			int result  = new tPageService().updateSeat(csList);
			int cid = csList.get(0).getcId();
			
			if(result > 0) {
				for(int i = 0 ; i<csList.size() ; i++){
					if(csList.get(i).getUserNo() <= 1000 && csList.get(i).getStatus().equals("Y") &&  csList.get(i).getApprove().equals("Y") && csList.get(i).getcId() == cid) {
						csList.add(csList.get(i));
					}
				}
			}
			
			session.setAttribute("stdList", csList);
			break;
		}
		
		
		new Gson().toJson(stdList, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
