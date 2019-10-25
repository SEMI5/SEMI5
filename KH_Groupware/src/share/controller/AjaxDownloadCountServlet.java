package share.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import share.model.service.SFileService;
import share.model.vo.Attachment;


/**
 * Servlet implementation class AjaxDownloadCountServlet
 */
@WebServlet("/ajaxDown.sh")
public class AjaxDownloadCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDownloadCountServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// view단에서 downloadBtn버튼 클릭시 ajax발생 후 fid1받아와서 int형으로 변환
		int fid = Integer.valueOf(request.getParameter("fid1")); 
		
		
		Attachment at = new SFileService().selectAttachment2(fid); 
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(at, response.getWriter());
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
