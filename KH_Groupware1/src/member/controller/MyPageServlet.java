package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import member.model.vo.khClass;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/mypage.me")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		khClass khClass = null;
		
		
		// 회원 userId로 조회해서 전체정보를 불러옴
		Member member = new MemberService().selectMember(userId);
		ArrayList<khClass> classList = new MemberService().callClass();
		
		
		
		
		
		for(int i = 0 ; i < classList.size() ; i++) {
			if(classList.get(i).getcId() == member.getcId()){
				khClass = classList.get(i);
				break;
			}
		}
		
		
		
		RequestDispatcher view = null;
		if(member != null) {
			view = request.getRequestDispatcher("views/member/memberView.jsp");
			request.setAttribute("member", member);
			request.setAttribute("khClass", khClass);
		} else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "조회에 실패했습니다.");
		}
		// forwarding (성공하던 실패하던)으로 넘김 
		view.forward(request, response);
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
