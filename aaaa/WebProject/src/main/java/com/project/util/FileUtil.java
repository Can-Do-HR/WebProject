package com.project.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	public List<String> fileListUpload(List<MultipartFile> fileList, String folderPath, int boardNum) {
		
		List<String> fileNameList = new ArrayList();
		folderPath += ("\\" + boardNum);
		
		File boardFolder = new File(folderPath);
		boardFolder.mkdir(); //^^
		
		for(int i = 0; i < fileList.size(); i++) {
			String realFileName = null;
			MultipartFile file = fileList.get(i);
			realFileName = fileUpload(file, folderPath);
			fileNameList.add(realFileName);
		}
		
		
		return fileNameList;
	}
	
	public String fileUpload(MultipartFile file, String folderPath) {
			
		String fileRealName = null;
		
		try {
			fileRealName = file.getOriginalFilename();
			
			File saveFile = new File(folderPath + "\\" + fileRealName);
			file.transferTo(saveFile);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileRealName;
	}
	
}
