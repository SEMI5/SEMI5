package thumbnail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.NBoardService;
import board.model.vo.Board;
import common.MyFileRenamePolicy;
import thumbnail.model.service.ThumbnailService;
import thumbnail.model.vo.Thumbnail;

/**
 * Servlet implementation class ThumbnailDelete
 */
@WebServlet("/tDelete.th")
public class ThumbnailDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailDeleteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 전송파일 용량 제한 : 10Mbyte로 제한하는 경우
			int maxSize = 1024 * 1024 * 10;	//바이트 단위(바이트 > 킬로바이트 > 메가바이트)
			
			// 1_2. 웹 서버 컨테이너 경로 추출함
			String root = request.getSession().getServletContext().getRealPath("/");	//넘어오는 파일 경로(web폴더 경로)
			// System.out.println("파일경로 : " + root);
			
			// 1_3. 파일들 저장 경로(web/"thumbnail_uploadFiles/)
			String savePath = root + "thumbnail_uploadFiles/";
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
											   // 우리가 재지정한 이름으로 저장한 파일명으로 저장된 파일이 savePath에 저장됨
			
			// 2_2. DB에 저장하기 위해 change_name과 origin_name 각각의 리스트들을 만들어 주는 작업
			
			// 다중 파일을 묶어서 업로드(다중 파일 업로드) 하기 때문에 컬렉션을 사용
			// 저장한 파일의 이름을 저장할 ArrayList를 생성하자 
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			// 원본 파일의 이름을 저장할 ArrayList를 생성하자
			ArrayList<String> originFiles = new ArrayList<String>();
			// <String> 제네릭 하는이유는 나중에 꺼낼때 다운캐스팅 안하려고
			
			// getFileNames() - 폼에서 전송된 파일 리스트들의 다중파일들의 name들을 반환한다. 반환값은 Enumeration(이더레이터의 옛날버전)으로 받아서 하나씩 돌리자
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()){
				
				// 전송 순서 역순으로 파일을 가져온다.
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					// getFilesystemName() - MyRenamePolicy의 rename 메소드에서 작성한 대로 rename된 파일명
					saveFiles.add(multiRequest.getFilesystemName(name));
					
					// getOriginalFileName() - 실제 사용자가 업로드 할때의 파일명
					originFiles.add(multiRequest.getOriginalFileName(name));
					
				}
			}	
		
		
		// 삭제시는 게시글 번호 정보만 받아오면됨
			int bid = Integer.parseInt(multiRequest.getParameter("bid"));
			
			ThumbnailService tbservice = new ThumbnailService();
			
			Thumbnail t= tbservice.selectThumbnailInfo(bid);

			
				int result = 0; 
				if (t.getBtype().equals("2")){
					result = tbservice.deleteThumbnail(2, bid);
					// FLAG  첨부파일 있을때
				}else {
					result = tbservice.deleteThumbnail(1, bid); // FLAG  첨부파일 없을때
				}
				
				if(result > 0) {
					response.sendRedirect("list.th");	//DB로 부터 갱신된 값을 불러와서 list.no로 넘어간다.
					
				} else {
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					request.setAttribute("msg", "사진게시판 삭제 실패!");
					view.forward(request, response);
				}
				
			}
				
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
