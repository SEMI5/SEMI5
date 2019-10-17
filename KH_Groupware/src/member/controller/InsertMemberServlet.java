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
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("userId"));
		
		int cid = Integer.valueOf(request.getParameter("class"));
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userRRN = request.getParameter("userRRN");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		

			
			Member member = new Member(cid, userId, userPwd, userName, userRRN, phone, email, address);
			
			
			// 3. 비지니스 로직을 수행할 서비스 메소드로 전달하고 그결과 값 받기
			int result = new MemberService().insertMember(member);  
			
			
			// 4. query까지 실행 후 return으로 받아온 이후 , 받은결과에 따라 성공/실패에 따른 페이지 내보내기 
			String page = ""; // 반환할 jsp의 경로(화면에 보여줄 view)를 저장할 String
			if(result > 0) { 	// 성공했을떄
				page = "views/common/memberhello.jsp";
				request.setAttribute("msg", "회원 가입 성공!");
				
			} else {	// 실패했을때
				page = "views/common/membersorry.jsp";
				request.setAttribute("msg", "회원 가입 실패!");
			}
			//넘어갈 view와 넘겨줄 request 객체를 같이 보내려면 forwarding 처리를 해야함
			RequestDispatcher view = request.getRequestDispatcher(page);
			
			view.forward(request, response);
			
			System.out.println(member);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
