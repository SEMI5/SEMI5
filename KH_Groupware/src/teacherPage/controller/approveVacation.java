package teacherPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import teacherPage.model.dao.tPageDao;
import teacherPage.model.service.tPageService;

/**
 * Servlet implementation class approveVacation
 */
@WebServlet("/approveVac.te")
public class approveVacation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public approveVacation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		int scdId = Integer.valueOf(request.getParameter("scdId"));
		String type = request.getParameter("type");
		
		int result  = 0;
		tPageService tps = new tPageService();
		
		if(type.equals("approve")){
			type = "V_Y";
		}else if(type.equals("reject")) {
			type = "V_N";
		}
		result = tps.approveVacation(scdId, type);
				
		System.out.println(scdId+"  "+type+"   "+result);
		
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
