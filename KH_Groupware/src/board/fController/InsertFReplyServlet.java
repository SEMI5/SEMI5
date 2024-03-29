package board.fController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.model.service.FBoardService;
import board.model.vo.Answer;
import board.model.vo.Good;
import board.model.vo.Reply;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/insertReply.bo")
public class InsertFReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩에 대한 필터는 적용 했으니까 따로 인코딩 내용은 작성하지 않고
		
		String writer = request.getParameter("writer");
		int bid = Integer.valueOf(request.getParameter("bid"));
		String content = request.getParameter("content");
		
		Reply r = new Reply();
		r.setrWriter(writer);
		r.setRefBid(bid);
		r.setrContent(content);
		
		ArrayList<Answer> alist= new FBoardService().selectAnswerList(bid);

		ArrayList<Reply> rlist = new FBoardService().insertReply(r);
		ArrayList<Good> glist = new FBoardService().selectGinfo(bid); 
		
		 System.out.println("인서트 리플 서블릿: " + alist );
		 LinkedHashMap<String,ArrayList> listMap = new LinkedHashMap<String,ArrayList>();
		 listMap.put("rlist",rlist);
		  listMap.put("glist",glist);
		  listMap.put("alist",alist);
		  
		  	
		response.setContentType("application/json;");	//charset=utf-8 해줘야 되는데 필터에서 해주니까 생략
		new Gson().toJson(listMap,response.getWriter());
		/* new Gson().toJson(glist,response.getWriter()); */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
