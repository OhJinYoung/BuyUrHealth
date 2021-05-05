package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy { // 이렇게 리네임을 하겠다라는 정책 implements FileRenamePolicy라는 상위 클래스가 있어야 함
	
	@Override
	public File rename(File originFile) {
		
		long currentTime = System.currentTimeMillis();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		int ranNum = (int)Math.random()*1000000;
		
		String name = originFile.getName();
		String ext = null;
		
		int dot = name.lastIndexOf(".");
		
		if(dot != -1) {
			ext = name.substring(dot);
		} else {
			ext = "";
		}
		
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext;
		
		File newFile = new File(originFile.getParent(), fileName); 
		
		return newFile;
	} 
	
}
