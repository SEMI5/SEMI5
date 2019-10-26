package share.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import share.model.service.SFileService;
import share.model.vo.Attachment;


/**
 * Servlet implementation class SFileDownloadServlet
 */
@WebServlet("/download.sh")
public class SFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SFileDownloadServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int fid = Integer.valueOf(request.getParameter("fid"));
			
			Attachment file = new SFileService().selectAttachment2(fid);
			
			// 클라이언트로 내보낼 출력 스트림 생성(요청된 파일을 읽어서 클라이언트쪽으로 저장한다.)
			ServletOutputStream downOut = response.getOutputStream();	//스트림 열기
			
			// 스트림으로 전송할 파일 객체 생성 (클라이언트가 다운로드할 파일 객체 생성)
			File downFile = new File(file.getFilePath() + file.getChangeName());
			
			// 강제적으로 다운로드 처리(한글 파일명 다운로드 받을 때)
			// 파일명을 changeName이 아닌 originName으로 다운 받을 수 있도록 처리(chrome 브라우저로 다운 받을 때)
			response.setHeader("Content-Disposition", "attachment; filename=\""
									+ new String(file.getOriginName().getBytes("UTF-8"),"ISO-8859-1")+"\"");
			
			// 어떤 어플이나 브라우저에서는 다운로드가 잘 동작하지 않을 수 있으므로 파일의 길이를 설정해서 reponse에 넘겨주는 것이 좋다.
			response.setContentLength((int)downFile.length());
			
			FileInputStream fin = new FileInputStream(downFile);	//기반스트림 열어서 파일을 외부로 끌어내려고 
			BufferedInputStream buf = new BufferedInputStream(fin);  // buffered로 향상시켜서
			
			int readBytes = 0;
			
			while((readBytes = buf.read())!= -1) {
				downOut.write(readBytes);	//고객한테 우리가 저장되어 있는값을 읽어서 넘겨준다.
			}
				downOut.close();
				buf.close();
			
			// 다운로드 잘 되는지 확인 !! 이러면 일단 jspProject는 일단락이 되긴 했는데!
			
			// 보완작업 같은걸 해보자
			// 1. 매 Servlet 마다 한글에 대한 encoding 작업을 했었는데
			// 이를 하나의 filter로 만들어서 매번 거치도록 하자!
			// --> filter 패키지를 만들어서 CommonFilter라는 filter를 만들러 가자!!
			
			
			// 2. 암호화 처리를 해보자
			// 		보통 사이트를 만들 때 사이트 관리자들 또한 회원에 대한 비밀번호를 알 수 없어야 된다.
			//		따라서 DB에 회원 정보가 저장될 때 암호화 된 비밀번호가 저장되어야 한다.
			//		--> wrapper 패키지를 만들어서 EncryptWrapper클래스를 만들러 가자!
		
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
