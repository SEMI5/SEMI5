package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전송 값에 한글이 있을 경우 인코딩 처리 해야한다. (doPost에서는 무조건 해야됨 하지만 doGet에서는 안해도 됨)
				request.setCharacterEncoding("UTF-8"); // 로그인에서는 필요없음(한글 쓸일 없으니까)
				
				// 2. 전송 값 꺼내서 변수에 기록하기 또는 객체에 저장하기 // ("userId")는 input태그의 name
				String userId = request.getParameter("userId");
				String userPwd = request.getParameter("userPwd");
				
				Member member = new Member(userId, userPwd);	
				
				// 3. 서비스 클래스의 해당 메소드를 실행하고, 그 처리 결과를  받음
				Member loginUser = new MemberService().loginMember(member);
				
				System.out.println(loginUser);				   
				
				// 4. 보낼 값에 한글이 있을 경우 인코딩 처리를 해야한다.
				// 지금 내보내는 내용을 html문으로 해석해라
				
				
				// 5. 서비스요청에 해당하는 결과를 가지고 성공/실패에 대한 뷰 페이지(파일)을 선택해서 내보냄
				if(loginUser != null) {	//성공일 경우(객체가 있으면)
					// 해당 클라이언트에 대한 세션 객체를 생성함 (Servlet단에서 요청이 있어야 세션객체를 생성할수있다)
					HttpSession session = request.getSession();	// session 객체는 request에서 제공하는 getSession()이라는 메소드로 만들 수 있음
					
					//객체를 session에 담는다.
					session.setAttribute("loginUser",loginUser);
					// session은 브라우져를 닫지않으면 객체가 사라지지않아서 페이지만 넘겨주면됨
					
					// session객체 유지 시간 조절하기
					// session.setMaxInactiveInterval(10);		// 초단위로 session객체 유지시간 설정가능
					
					response.sendRedirect("index.jsp");
					// location.href와 같은의미 (페이지 이동) = sendRedirect(Servlet에서)
				
				} else {
					//객체를 request에 담는다. "msg"-속성이름, "로그인실패"-속성객체
					request.setAttribute("msg", "로그인실패");
					// request는 요청처리를 처리하면 정보가 사라지므로 객체와 페이지정보를 같이넘겨줌(request, response)
					
											 // ("views/common/errorPage.jsp")대한 정보를 객체로 가져와서 view에  담는다.
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);
					// 객체와 view에대한 정보가 같이 날라감 (forwarding방식)
				}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		
		doGet(request, response);
	}

}
