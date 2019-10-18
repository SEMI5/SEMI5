package wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	
	}
	
	
	// ServletRequestWrapper의 getParameter 메소드를 오버라이딩 (재정의)
		@Override
		public String getParameter(String key) {
			
			String value = "";
			// 값을 꺼낼때 userPwd라면
			if(key != null && key.equals("userPwd")) {
				
				// request 객체에 담긴 파라미터 key 값이 userPwd인 경우 암호화 하는 내용
				value = getSha512(super.getParameter(key));
				
			} else {
				value = super.getParameter(key);
			}
			
			return value;
		}

		/*
		 *  sha512 해쉬 함수를 사용하여 암호화한다.
		 */
		private static String getSha512(String userPwd) {
				  //인코딩 pwd
			String encPwd = null;
			
			// SHA-512 방식의 암호화 객체
			MessageDigest md = null;
			
			try {
				md = MessageDigest.getInstance("SHA-512");
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			
			// 전달 받은 userPwd를 UTF-8 형식의 바이트 배열로 리턴함
			byte[] bytes = userPwd.getBytes(Charset.forName("UTF-8"));		
			
			// md 객체에 userPwd 바이트 배열을 전달해서 갱신
			md.update(bytes);
			
			//java.util.base64 인코더를 이용해서 암호화된 바이트 배열을 인코딩해서 문자열로 출력
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			// 암호화 처리된 값을 다시 String형으로 변환해줌(DB로 넘겨주려고 String으로)
			
			return encPwd;
		}

		// 이제 이 EncryptWrapper를 필터에 적용시키기 위해 EncryptFilter를 만들러가자!(filter 폴더로)
		
}
