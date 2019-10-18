package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();

    
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");	// 꺼내온 값이 String이라 String으로 받아줌
		String userPwd = request.getParameter("userId");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");

		
																
		int result = new MemberService().updateMember(new Member(userId, userPwd, phone, email, address));
		
		// 4. query까지 실행 후 return으로 받아온 이후 , 받은결과에 따라 성공/실패에 따른 페이지 내보내기 
				String page = ""; // 반환할 jsp의 경로(화면에 보여줄 view)를 저장할 String
				if(result > 0) { 	// 성공했을떄
					page = "views/common/successPage.jsp";
					request.setAttribute("msg", "회원 정보수정 성공!");
					
				} else {	// 실패했을때
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "회원 정보수정 실패!");
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
