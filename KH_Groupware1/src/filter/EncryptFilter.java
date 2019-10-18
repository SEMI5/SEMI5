package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import wrapper.EncryptWrapper;

/**
 * Servlet Filter implementation class EncryptFilter
 */
@WebFilter(filterName = "encrypt",urlPatterns = "*.me")
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
    	System.out.println("EncryptFilter 작동!");
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 매개변수로 받아온 ServletRequest를 HttpServletRequest로 캐스팅 해주는 작업부터
				HttpServletRequest h_request = (HttpServletRequest)request;
				
				// 암호화 래퍼 객체 생성
				EncryptWrapper encWrapper = new EncryptWrapper(h_request);
				
//				chain.doFilter(request, response);
				chain.doFilter(encWrapper, response); // 암호화된 래퍼객체를 실행됨
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
