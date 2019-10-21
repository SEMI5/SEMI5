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
import member.model.vo.khClass;

/**
 * Servlet implementation class callClassServlet
 */
@WebServlet("/cclass.me")
public class callClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public callClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		ArrayList<khClass> cList = new MemberService().callClass();
		
		System.out.println(cList);
	
		RequestDispatcher view = null;
		if(cList != null) {
			request.setAttribute("class", cList);
			view = request.getRequestDispatcher("views/member/memberJoinForm.jsp");
			view.forward(request, response);
		}else {
			request.setAttribute("msg", "반정보 불러오기 실패");
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
			
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
