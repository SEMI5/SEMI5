package share.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import share.model.service.SFileService;
import share.model.vo.Attachment;
import share.model.vo.PageInfo;

/**
 * Servlet implementation class ShareFileListServlet
 */
@WebServlet("/list.sh")
public class SFileListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SFileListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			

		// 파일 관련 즉 사진게시판을 위해 Attachment라는 테이블을 활용할 것이다.
		// 따라서 Attachment(올라간 사진의 정보) vo클래스 만들러 ㄱㄱ
				
		// vo클래스 만들었으면, BoardService로 두개의 서비스를 요청할 것이다!
		// 사진게시판은 일반게시판과 달리 페이징 처리를 안할거지만 하고 싶으면 board관련 코드 참고해서 완성해보자
				
		SFileService tService = new SFileService();
				
		// 자료실 - 자료 리스트 구하기
		ArrayList flist = tService.selectList();
		System.out.println("flist :::: " + flist);
		
		
		
		// int bid = Integer.valueOf(request.getParameter("bid"));
		
		// ArrayList<Attachment> fileList = tService.selectShare(bid);
		
		// 게시판 게시글의 리스트 총 갯수 구하기 
		int listCount = tService.getListCount();
	      System.out.println("listcount " +listCount);
		
	   // ******* ------페이징 처리 추가 --------------------------
			// 페이지 수 처리용 변수 선언
			int currentPage;	// 현재 페이지를 표시할 변수
			int limit;			// 한 페이지에 게시글이 몇개(10개)가 보여질지와 한 페이지에서 처리가능한 페이지 수(1~10)
								// 두개의 수가 다르게 하려면 변수를 따로 받아야함
			int maxPage;		// 전체 페이지에서 가장 마지막 페이지 (23개의 글이면 3페이지가 마지막페이지)
			int startPage;		// 한번에 표시될 페이지가 시작할 페이지
			int endPage;		// 한번에 표시될 페이지가 끝나는 페이지
			
			// ex) 총 123개의 게시글이 있다면..
			//	<< 1 2 3 4 5 6 7 8 9 10 >> 이후에도 페이자가 더 있어야 한다.
			//	<< 11 12 13 >>			   <-- 여기서 11이 startPage, 13이 endPage, 13이 maxPage
			
			// * currentPage - 현재 페이지
			// 기본 게시판은 1페이지부터 시작함
			currentPage = 1;		// 1 페이지를 default로 가져가자
			// 하지만, 페이지 전환시 전달 받은 현재 페이지가 있을 시 해당 페이지를 currentPage로 적용
			if(request.getParameter("currentPage")!= null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));	// 덮어씌우기
			}
			
			// * limit - 한 페이지에 보여질 목록 갯수
			limit = 10;
			
			// * maxPage - 총 페이지 수 
			// 목록 수가 123개 이면 13페이지가 마지막 페이지다
			// 짜투리 목록이 최소 1개일때, 한 page로써 의미를 갖게 하기위해서 0.9를 더해주자
			maxPage = (int)((double)listCount/limit + 0.9);
			
			// * startPage - 현재 페이지에 보여질 시작 페이지 수
			// 아래쪽에 페이지 수가 10개씩 보여지게 할 경우
			// 1, 11, 21, 31, ...
			
			// 1 - 0xlimit + 1
			// 11 - 1xlimit + 1
			// 21 - 2xlimit + 1
			// (double)listCount/limit + 0.9))가 1,2,3로 시작되서 -1 해줘서 0,1,2로 바꿔줌
			// startPage = (((int)((double)listCount/limit + 0.9))-1) * limit + 1;							
			// startPage = (maxPage -1) * limit + 1;
			startPage = (((int)((double)currentPage/limit + 0.9))-1)*limit + 1;
			
			// * endPage - 현재 페이지에서 보여질 마지막 페이지 수 
			// 아래쪽에 페이지 수가 10개씩 보여지게 할 경우
			// 10, 20, 30, 40, ....
			endPage = startPage + limit - 1;
			// 마지막 페이지가 10,20,30,40...이 안될경우는 지금 공식으로는 에러가 난다.
				
			// 하지만 !!! 마지막 페이지 수가 총 페이지 수보다 클 경우 
			// maxPage가 13이고 endPage가 20페이지일 경우
			if(maxPage < endPage) {
				endPage = maxPage;	// 마지막페이지가 최대페이지가 된다.
			}
			
			// 자 위에서 계산된 모든 페이지 관련 변수들을 request에 담아서  보내야 될텐데 너무 많다!
			// 그래서 페이지 정보를 공유할 vo 객체 PageInfo를 만들러가자!! (page정보만 지닌 객체를 만들어서 넘기기 위해)
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		// 페이징 처리할 자료실 리스트 구하기
		ArrayList<Attachment> list = tService.selectList(currentPage, limit);	
		 System.out.println("페이지 확인용 :" + list);
		
		RequestDispatcher view = null;

		if(list != null) {
			// request.setAttribute("fileList", fileList);
			// request.setAttribute("flist", flist);
			// System.out.println("servletflist " + flist);
			
			request.setAttribute("list", list); // 현재 페이지에 화면에 뿌려질 게시글이 담긴 객체
			request.setAttribute("pi", pi);	// 페이지에 관련된 정보가 담긴 객체
			request.getRequestDispatcher("views/share/SFileListView.jsp").forward(request, response);	
		
		
		}else {												  	
			request.setAttribute("msg", "자료실 조회실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		
		
	}
	}
				
				

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
