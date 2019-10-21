package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;
// common 패키지 안에 MyFileRenamePolicy 클래스를 FileRenamePolicy를 상속받아 만들어 주자!!

public class MyFileRenamePolicy implements FileRenamePolicy{
	
	// 원본 파일명이 뭐든지 시간단위로 바꿔준다.
	// 추상메소드 구현
	@Override
	public File rename(File originFile) {
		// arg0 -> originFile 매개변수 변경
		long currentTime = System.currentTimeMillis();	// 현재시간을 밀리세컨 단위의 long 형으로 반환해주는 메소드
		
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");	// 파일명을 파일을올린 시간으로 변경
		
		int ranNum = (int)(Math.random()*100000);
		
		// 확장자 명 가져오기!
		String name = originFile.getName();  	// 원본 파일명
		String ext = null;						// 확장자만 저장할 변수
		
		// 확장자만 짤라내는 작업
		int dot = name.lastIndexOf(".");		// 마지막에 등장하는 "."을 찾음
		
		if(dot != -1){						// 파일명이 없으면	
			ext = name.substring(dot);		// ext - 짤라낸 확장자명
		} else {
			ext = "";
		}
										//Date - util,, 새 이름에 짤라냈던 확장자를 붙임
		String fileName = ft.format(new Date(currentTime))	+ ranNum + ext;		//새로 우리가 시간으로 파일명을 안겹치게 지정한 파일명
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;	//새로운 파일명 반환
	}

}
