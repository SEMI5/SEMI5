package share.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import share.model.service.SFileService;
import share.model.vo.Attachment;
import share.model.vo.Share;

/**
 * Servlet implementation class DetailSfileServlet
 */
@WebServlet("/Sdetail.sh")
public class DetailSfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailSfileServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bid=Integer.parseInt(request.getParameter("bid"));
		Share share = new SFileService().selectShare(bid);
		Share sharePrev = new SFileService().selectShare2(bid-1);  // 조회수 올리지 않는 메소드를 새로 작성해서 가져와야함. 
		Share shareNext= new SFileService().selectShare2(bid+1);
		
		SFileService sService = new SFileService();
		// 2. 해당 게시판의 사진들 리스트 조회!
		ArrayList<Attachment> fileList = sService.selectShareThumbnail(bid);
		
		// --------------------이 부분은 ajax 기능으로 댓글 기능을 추가하기 위해 작성하는 부분 ------------------- 
		// 우선 댓글 달기 기능을 위해서 Reply vo 클래스를 만들어 주고 오자.
		/*
		 * ArrayList<Reply> rlist = new NBoardService().selectReplyList(bid);
		 * System.out.println(rlist);
		 * 
		 * //---------------------------------------------------------------------------
		 */ 
		 
		 if(share != null) { 
			 request.setAttribute("share", share);
			 request.setAttribute("sharePrev", sharePrev);
			 request.setAttribute("shareNext", shareNext);
			 
			request.setAttribute("fileList", fileList);
		  // --------------------이 부분은 ajax 기능으로 댓글 기능을 추가하기 위해 작성하는 부분
		  //------------------- request.setAttribute("rlist", rlist); //
		  //boardDetailView.jsp로 가서 댓글리스트가 보여지도록 화면단 작성하자
		  request.getRequestDispatcher("views/share/shareFileDetailView.jsp").forward(request, response); 
		  }else { 
			  request.setAttribute("msg", "게사판 상세조회 실패!");
			  request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response); 
		  }
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
