package map.controller;

import java.awt.Window;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java.swing.plaf.windows.resources.windows;

import map.model.service.TRService;
import map.model.vo.TR_list;

/**
 * Servlet implementation class AddlistServlet
 */
@WebServlet("/insert.tr")
public class TRinsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TRinsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String trName = request.getParameter("TR_name");
		String trMemo = request.getParameter("TR_memo");
		String trLatLng = request.getParameter("TR_LatLng");
		
		TR_list tr = new TR_list(trName, trMemo, trLatLng);
		
		System.out.println(tr);
		
		int result = new TRService().insertTR(tr);
		
		System.out.println(result);
		
		if(result > 0) {
			//response.sendRedirect("mainHome.jsp");
			response.sendRedirect("views/common/mapSuccess.jsp");
			
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp"); 
			request.setAttribute("msg", "실패함!");
			
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
