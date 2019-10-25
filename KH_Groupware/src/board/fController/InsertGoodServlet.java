package board.fController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.model.service.FBoardService;
import board.model.vo.Good;
import board.model.vo.Reply;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/insert.go")
public class InsertGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertGoodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		  int userNo = Integer.valueOf(request.getParameter("userNo"));  
		  int rid = Integer.valueOf(request.getParameter("rid1"));
		  
		
		  
		  System.out.println("인서트 서블릿 go: " + userNo +" ,"+ rid); 
		  FBoardService fbs = new FBoardService(); 
		  
		  
		  Good good = null;
		  int result = 0;
		  int gid = 0; 
		  good = fbs.SelectGoodRecord(userNo, rid);
		
	
		  
		  if(good != null) { // 게시글을 누른적이 있다면, 삭제 
			  gid = good.getgId(); 
			  result = fbs.deleteGoodRecord(gid);
			  System.out.println("조아요 취소 ");
			  
		  }else { // 게시글을 누른적이 없다면 삽입 
			  result = fbs.insertGoodRecord(rid, userNo);
			  System.out.println("조아요 누름 ");
		  }
		  
		  response.setContentType("application/json;"); 
		  new Gson().toJson(result,response.getWriter());
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
