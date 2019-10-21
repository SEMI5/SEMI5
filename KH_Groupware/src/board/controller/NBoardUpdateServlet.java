package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.NBoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import common.MyFileRenamePolicy;
import member.model.vo.Member;


/**
 * Servlet implementation class InsertThumbnailServlet
 */
@WebServlet("/Nupdate.bo")
public class NBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NBoardUpdateServlet() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");	
				
	
				if(ServletFileUpload.isMultipartContent(request)) {
					
					int maxSize = 1024 * 1024 * 10;	//바이트 단위(바이트 > 킬로바이트 > 메가바이트)
					
					String root = request.getSession().getServletContext().getRealPath("/"); 	//넘어오는 파일 경로(web폴더 경로)
					String savePath = root + "nBoard_uploadFiles/";
					
				
			
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
						
						System.out.println(originFiles);
					}
					
					// 
					String title = multiRequest.getParameter("btitle");
					String content = multiRequest.getParameter("bcontent");
					String btype = multiRequest.getParameter("btype");
					int blevel = Integer.parseInt(multiRequest. getParameter("blevel"));		
					int bid = Integer.parseInt(multiRequest. getParameter("bid"));					
					String bwriter = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());	
					int cId = ((Member)request.getSession().getAttribute("loginUser")).getcId();
									
					int [] fidList = new int[8]; 
					fidList[0] = Integer.parseInt(multiRequest.getParameter("delFid1"));
					fidList[1] = Integer.parseInt(multiRequest.getParameter("delFid2"));
					fidList[2] = Integer.parseInt(multiRequest.getParameter("delFid3"));
					fidList[3] = Integer.parseInt(multiRequest.getParameter("delFid4"));
					fidList[4] = Integer.parseInt(multiRequest.getParameter("delFid5"));
					fidList[5] = Integer.parseInt(multiRequest.getParameter("delFid6"));
					fidList[6] = Integer.parseInt(multiRequest.getParameter("delFid7"));
					fidList[7] = Integer.parseInt(multiRequest.getParameter("delFid8"));
				
			/*
			 * System.out.println(fidList[0]); System.out.println(fidList[1]);
			 * System.out.println(fidList[2]); System.out.println(fidList[3]);
			 * System.out.println(fidList[4]); System.out.println(fidList[5]);
			 * System.out.println(fidList[6]); System.out.println(fidList[7]);
			 */
					
					for(int i=0; i<fidList.length; i++) {
						if(fidList[i] > 0) {
							int result = new NBoardService().deleteAttachAsFid(fidList[i]);
						}
					}
		
					
			
					if(!(saveFiles.isEmpty())){
						btype = "2" ;
					}
						
					
				
					// 3_2. DB에 보낼 thumbnail 객체와 Attachment 리스트 생성
					
					Board b = new Board();
					
					b.setcId(cId);
					b.setbTitle(title);
					b.setBtype(btype);
					b.setbContent(content);
					b.setbWriter(bwriter);
					b.setbId(bid);
					b.setBlevl(blevel);	
					ArrayList<Attachment> fileList = new ArrayList<Attachment>();
					// 전송 순서 역순으로 파일이 list에 저장되어 있기 때문에 반복문을 역으로 수행함
					for(int i = originFiles.size()-1; i >= 0; i--) {
						Attachment at = new Attachment();
						at.setFilePath(savePath);
						at.setOriginName(originFiles.get(i));
						at.setChangeName(saveFiles.get(i));
						
						// 타이틀 이미지가 originFiles에서의 마지막 인덱스이기 때문에 다음과 같이 조건을 준 다음에 level을 0으로 지정
						if(i == originFiles.size()-1) {
							at.setFileLevel(0);		// 대표 이미지의 fileLevel 값은 0 
						} else {
							at.setFileLevel(1);  	// 대표 이미지를 제외한 이미지의 fileLevel 값은 1
						}
						
						fileList.add(at);	// ArrayList<Attachment>에 쌓음
						
					}
					
					// 이렇게 하면 DB를 다녀올 준비가 끝남 
					int result = 0; 
					
					if(saveFiles.isEmpty()) { // 첨부파일이 하나도 없다면, 
						result = new NBoardService().updateBoard(b);
					}else{ // 첨부파일 있다면 
					    result = new NBoardService().updateNBoard(b,fileList);
					}
					
					
					
					//System.out.println(result);
					
					if(result > 0) {
						response.sendRedirect("Nlist.bo");  //DB에 갔다가 갱신된 데이터를 가져와야함
						
					} else {
						// 실패시 저장된 사진 삭제
						for(int i = 0; i <saveFiles.size(); i++) {
							// 파일 시스템에 저장된 이름으로 파일 객체 생성함
							File failedFile = new File(savePath + saveFiles.get(i));
							failedFile.delete();
						}
						
						request.setAttribute("msg", "공지사항 첨부파일 등록 실패!!");
						request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					}
						// 여기까지 테스트 해보고 잘 되면 이제 사진 게시판 상세보기를 하자!! thumbnailListView.jsp로 돌아가자! 
				}

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		doGet(request, response);
	}

}
