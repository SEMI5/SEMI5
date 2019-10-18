package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/delete.me")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
        super();

    
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		int result = new MemberService().deleteMember(userId);
		
		String page = ""; // 반환할 jsp의 경로(화면에 보여줄 view)를 저장할 String
		if(result > 0) { 	// 성공했을떄
			page = "views/common/successPage.jsp";
			request.setAttribute("msg", "회원 탈퇴 성공!");
			request.getSession().invalidate();	// 세션객체안에 속성들이 무효화 (세션은 남아있음) . 로그인한 사람의 정보가 담긴 Session을 무효화
		} else {	// 실패했을때
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 탈퇴 실패!");
		}
		//넘어갈 view와 넘겨줄 request 객체를 같이 보내려면 forwarding 처리를 해야함
		RequestDispatcher view = request.getRequestDispatcher(page);
		
		view.forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		doGet(request, response);
	}

}
