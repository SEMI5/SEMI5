package thumbnail.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thumbnail.model.service.ThumbnailService;
import thumbnail.model.vo.PageInfo;
import thumbnail.model.vo.Thumbnail;

/**
 * Servlet implementation class ThumbanailListServlet
 */
@WebServlet("/list.th")
public class ThumbnailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailListServlet() {
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
				
		ThumbnailService tService = new ThumbnailService();
				
		// 1. 우선 사진 게시판 리스트 정보를 불러오자
		ArrayList blist = tService.selectList(1);
		
		// 2. 사진 리스트도 불러오자
		ArrayList flist = tService.selectList(2);

		// thumbnail 폴더만들고 그안에 thumbnailListView.jsp 만들러 ㄱㄱ!!!
		
		
		
		// 게시판 게시글의 리스트 총 갯수 구하기 
		int listCount = tService.getListCount();
		// System.out.println(listCount);
		
		int currentPage;	// 현재 페이지를 표시할 변수
		int limit;			// 한 페이지에 게시글이 몇개(10개)가 보여질지와 한 페이지에서 처리가능한 페이지 수(1~10)
							// 두개의 수가 다르게 하려면 변수를 따로 받아야함
		int maxPage;		// 전체 페이지에서 가장 마지막 페이지 (23개의 글이면 3페이지가 마지막페이지)
		int startPage;		// 한번에 표시될 페이지가 시작할 페이지
		int endPage;		// 한번에 표시될 페이지가 끝나는 페이지
		
		currentPage = 1;		// 1 페이지를 default로 가져가자
		// 하지만, 페이지 전환시 전달 받은 현재 페이지가 있을 시 해당 페이지를 currentPage로 적용
		if(request.getParameter("currentPage")!= null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));	// 덮어씌우기
		}
		
		// * limit - 한 페이지에 보여질 목록 갯수
		limit = 8;
				
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9))-1)*limit + 1;
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;	// 마지막페이지가 최대페이지가 된다.
		}
		
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		// 게시판 리스트 조회해오기
		ArrayList<Thumbnail> list = tService.selectList(currentPage, limit);	
		
		RequestDispatcher view = null;
		/*
		 * if(list != null) { view =
		 * request.getRequestDispatcher("views/thumbnail/thumbnailListView.jsp");
		 * request.setAttribute("list", list); // 현재 페이지에 화면에 뿌려질 게시글이 담긴 객체
		 * request.setAttribute("pi", pi); // 페이지에 관련된 정보가 담긴 객체 } else { view =
		 * request.getRequestDispatcher("views/common/errorPage.jsp");
		 * request.setAttribute("msg", "게시판리스트 조회 실패"); }
		 * 
		 * view.forward(request, response); // boardListView.jsp 페이지 만들러 ㄱㄱ!
		 */		
		
		 // System.out.println("blist : " + blist);
		// System.out.println("flist : " + flist);
		// 사진불러오기랑 페이징처리 같이 forward함
		if(blist != null && flist != null && list != null) {
			request.setAttribute("blist", blist);
			request.setAttribute("flist", flist);
			request.setAttribute("list", list); // 현재 페이지에 화면에 뿌려질 게시글이 담긴 객체
			request.setAttribute("pi", pi);	// 페이지에 관련된 정보가 담긴 객체
			request.getRequestDispatcher("views/thumbnail/thumbnailListView.jsp").forward(request, response);	
		
		
		}else {												  	
			request.setAttribute("msg", "사진게시판 조회실패!");
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
