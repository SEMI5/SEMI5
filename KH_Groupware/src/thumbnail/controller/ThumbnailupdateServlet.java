package thumbnail.controller;

import java.io.File;
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
import common.MyFileRenamePolicy;
import thumbnail.model.service.ThumbnailService;
import thumbnail.model.vo.Attachment;
import thumbnail.model.vo.Thumbnail;

/**
 * Servlet implementation class updateThumbnailServlet
 */
@WebServlet("/update.th")
public class ThumbnailupdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailupdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	

		
		// enctype이 multipart/form-data로 전송되었는지 확인!
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;	
			String root = request.getSession().getServletContext().getRealPath("/");	//넘어오는 파일 경로(web폴더 경로)
			String savePath = root + "thumbnail_uploadFiles/";
										   
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		    String  delImg = multiRequest.getParameter("delImg2");

			int [] delImgList= new int[5]; 
			 
			delImgList[0] = Integer.parseInt(multiRequest.getParameter("delImg1"));  
			delImgList[1]= Integer.parseInt(multiRequest.getParameter("delImg2"));  
			delImgList[2]= Integer.parseInt(multiRequest.getParameter("delImg3"));  
			delImgList[3]= Integer.parseInt(multiRequest.getParameter("delImg4"));  
			delImgList[4]= Integer.parseInt(multiRequest.getParameter("delImg5"));  
		
			System.out.println(delImgList[0]);
			System.out.println(delImgList[1]);
			System.out.println(delImgList[2]);
			System.out.println(delImgList[3]);
			System.out.println(delImgList[4]);
			
			
			System.out.println(delImgList);
			
			for(int i=0; i<delImgList.length; i++) {
					if(delImgList[i] > 0) {
					int result = new ThumbnailService().deleteAttachAsFid(delImgList[i]);   
					}
			}
			
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()){
				String name = files.nextElement();
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i = originFiles.size()-1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				fileList.add(at);
			}
			 
		
			
			// 변경해야할 fid 
			int [] fidList= new int[5]; 
			fidList[0]= Integer.parseInt(multiRequest.getParameter("updateImg1")); 
			fidList[1]= Integer.parseInt(multiRequest.getParameter("updateImg2")); 
			fidList[2]= Integer.parseInt(multiRequest.getParameter("updateImg3")); 
			fidList[3]= Integer.parseInt(multiRequest.getParameter("updateImg4")); 
			fidList[4]= Integer.parseInt(multiRequest.getParameter("updateImg5")); 
		
			int count = -1; 
			int result = 0; 
			for(int i=0; i<fidList.length; i++) {
				if(fidList[i]> 0) {
					count++; 
					result = new ThumbnailService().updateAttachment(fidList[i],fileList.get(count));
				}
			}
		
		
		
		
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			int bid = Integer.parseInt(multiRequest.getParameter("bid"));	//getParameter는 String형이라 필요하면 변환작업해야함
			
	
			// 게시판 텍스트 를 변경.
			Thumbnail t = new Thumbnail();
			t.setbTitle(title);
			t.setbContent(content);
			t.setbId(bid);
			int result2= 0;
			
			
				
			result2 = new ThumbnailService().updateThumbnail(t);
			
			

			
			ThumbnailService bService = new ThumbnailService();

			 // (변경된) 게시판 텍스트와 (변경된) 게시판 첨부파일을 조회해옴 (뷰에 다시 뿌려주기 위해서)  
			Thumbnail thumbnail = bService.selectThumbnailInfo(bid);
			ArrayList<Attachment> fileList1 = bService.selectThumbnail(bid);
			
			
			RequestDispatcher view = null;
			if(result2 > 0) {  // 실제 게시판이 변경되었다면, 뷰에 뿌려주기.
				view = request.getRequestDispatcher("views/thumbnail/thumbnailDetailView.jsp");
				request.setAttribute("thumbnail", thumbnail);
				request.setAttribute("fileList", fileList1);
				request.setAttribute("Thumbnail", new ThumbnailService().selectThumbnailInfo(bid));		
			} else {
				view = request.getRequestDispatcher("views/common/errorPage.jsp");
				request.setAttribute("msg", "공지사항 수정 실패");
			}
			view.forward(request, response);
			
			
		}
			
			
			
			
			
		

	
	
	
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
