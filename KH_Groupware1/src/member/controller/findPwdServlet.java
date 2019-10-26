package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.MemberService;

/**
 * Servlet implementation class findPwdServlet
 */
@WebServlet("/findPwd.me")
public class findPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		String userId = request.getParameter("userId");
		String email = request.getParameter("emailId") +"@"+ request.getParameter("emailTail");
		String phone = request.getParameter("tel0")+"-"+request.getParameter("tel1")+"-"+request.getParameter("tel2");
		String newPwd = "";
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', 
				'6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
				'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' };
		char[] symbolsSet = new char[] { '!', '@', '#', '$', '%', '^', 
				'&', '*', '(', ')' };
		
		for (int i = 0 ; i < 5 ; i++) {
			newPwd += charSet[(int) (charSet.length * Math.random())];
		};
		for (int i = 0 ; i < 3 ; i++) {
			newPwd += symbolsSet[(int) (symbolsSet.length * Math.random())];
		};
		
		newPwd += String.valueOf((int)((Math.random() * 100) + 1));
		
		
		
		
		System.out.println(userId +"   "+email+"   "+phone+"   "+newPwd);
		
		int result = new MemberService().findPwd(userId, email, phone, newPwd);
		
	
		if(result == 1) {
			new Gson().toJson(newPwd, response.getWriter());
		}else {
			new Gson().toJson(0, response.getWriter()); 
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
