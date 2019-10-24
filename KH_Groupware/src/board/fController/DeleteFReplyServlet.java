package board.fController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sun.javafx.collections.MappingChange.Map;

import board.model.service.FBoardService;
import board.model.vo.Board;
import board.model.vo.Good;
import board.model.vo.Reply;

/**
 * Servlet implementation class DeleteNBoardServlet
 */
@WebServlet("/Fdelete.re")
public class DeleteFReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int rid = Integer.valueOf(request.getParameter("rid"));
		int bid = Integer.valueOf(request.getParameter("bid"));
		FBoardService Fbservice = new FBoardService();
		
	   ArrayList rlist  = Fbservice.deleteReply(rid,bid);
	   ArrayList glist = new FBoardService().selectGinfo(bid); 
			System.out.println("델리트: " + rlist);
			System.out.println("델리트: " +glist );
			
		
		  HashMap<String,ArrayList> listMap = new HashMap<String,ArrayList>();
		  listMap.put("rlist",rlist); 
		  listMap.put("glist",glist);
		 
			
			
			response.setContentType("application/json;");	//charset=utf-8 해줘야 되는데 필터에서 해주니까 생략
		new Gson().toJson(listMap, response.getWriter());
		/* new Gson().toJson(glist, response.getWriter()); */

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
