package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * 
 * 필터를 통해 인코딩작업을 안해도 필터를 거쳐가서 인코딩작업이 되도록 함
 */

/*
 *  filterName : 어떤 역할을 하는 필터인지 지정
 *  urlPatterns : 어떠한 서블릿을 가기전에 실행될 것인지를 지정 --> /* 로 지정하게 되면 모든 서블릿을 뜻한다.
 */
@WebFilter(filterName="enConding",urlPatterns="/*")	// ("/*.me")등으로 특정 서블릿으로만 적용할수있다
public class CommonFilter implements Filter {

    /**
     * 필터는 Servlet 2.3 이상에서 사용가능
     * 서블릿 필터는 request, response가 서블릿이나 JSP 등 리소스에 도달하기 전 필요한 전/후 처리작업을 맡는다.
     * 
     * Filter의 생명 주기
     * - init() 	: 컨테이너가 필터를 인스턴스화 할 때 호출한다.
     * 				  필터 설정 관련 코드 작성 가능
     * 				 FilterConfig 객체를 인자로 받아 필드화 할 수 있음
     * 
     * - doFilter()	: 컨테이너가 현재 요청에 필터 적용을 하겠다 판단하면 호출함
     * 				 ServletRequest,ServletResponse, FilterChain 객체
     * 
     * - destroy() : 컨테이너가 필터 인스턴스를 제거할 때 호출한다.
     * 
     */
    public CommonFilter() {
    	//기본생성자
    	System.out.println("CommonFilter 작동!");		//객체가 생성되는 순간 출력됨
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// destroy() : 컨테이너가 필터 인스턴스를 제거할 때 호출한다.
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// doFilter()	: 컨테이너가 현재 요청에 필터 적용을 하겠다 판단하면 호출함
	    // 		        	 ServletRequest,ServletResponse, FilterChain 객체
		
		// 1. 뷰에서 전달 받은 값에 한글이 있을 경우
		request.setCharacterEncoding("UTF-8");
		
		// 2. 뷰로 전달할 값에 한글이 있는 경우
		response.setContentType("text/html;charset=utf-8");
		
		// 다음 필터를 호출하거나, 마지막이라면 Servlet이나 jsp를 호출함
		chain.doFilter(request, response);
		
		// Filter(인터페이스)의 doFilter(request, response, chain)과 
		// FilterChain의 doFilter(request, response)는 다르다.
		// --> Filter의 doFilter()는 진짜 필터링 작업을 함
		// --> FIlterChain의 doFilter()는 다음 필터를 호출하거나, 마지막이라면 Servlet이나 jsp를 호출함
	
	
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		//- init() 	: 컨테이너가 필터를 인스턴스화 할 때 호출한다.
	    // 			      필터 설정 관련 코드 작성 가능
	    // 			   FilterConfig 객체를 인자로 받아 필드화 할 수 있음
		
	}

}
