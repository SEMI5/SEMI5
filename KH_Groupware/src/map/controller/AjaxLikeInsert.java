package map.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import map.model.service.TRService;
import map.model.vo.TR_SCORE;
import member.model.vo.Member;

/**
 * Servlet implementation class AjaxLikeInsert
 */
@WebServlet("/ajaxLikeInsert.tr")
public class AjaxLikeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxLikeInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String loginUser = request.getParameter("loginUser");
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int userNo =  Integer.valueOf(loginUser.getUserNo());
		int JoinedTrNo = Integer.valueOf(request.getParameter("SameTrNo"));
		
		TR_SCORE ts = new TR_SCORE(JoinedTrNo, userNo);
		int result = new TRService().insertScore(ts);
		
		System.out.println(userNo +"dsfsdf"+ JoinedTrNo);
		System.out.println("등록 여부 (abcd): " + result);
		
		if(result > 0) {
			System.out.println("등록되었습니다.");
		}else {
			System.out.println("등록 실패되었습니다");
		}
		
		response.setContentType("application/json;charset=utf-8");
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
