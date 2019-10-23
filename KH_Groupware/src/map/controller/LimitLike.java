package map.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import map.model.service.TRService;
import map.model.vo.TR_SCORE;
import member.model.vo.Member;

/**
 * Servlet implementation class LimitLike
 */
@WebServlet("/limitLike.tr")
public class LimitLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LimitLike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int a = Integer.valueOf(loginUser.getUserNo());
		int b = Integer.valueOf(request.getParameter("SameTrNo"));
		
		TR_SCORE ts = new TR_SCORE(b, a);
		int result = new TRService().limitLikes(ts);
		
		System.out.println("데이터가 잘 넘어 왔나용?? 0이면 가능, 1이면 불가능 = " + result);
		
		PrintWriter out = response.getWriter();
		if(result == 0) {
			out.append("possible");
			System.out.println("존재하지 않아서 등록 가능합니다.");
		}else if(result == 1){
			out.print("impossible"); // append("fail")해도 됨.
			System.out.println("이미 존재해서 등록 불가능합니다.");
		}
		out.flush();
		out.close();		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
