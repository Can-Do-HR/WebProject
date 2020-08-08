package com.project.creator.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * 게시판에서 들고올때 한번에 들고오는 기능을 함.
 * @author dhr
 *
 */
public class MultiEnrollBoardContentVO {
	
	private ArrayList<EnrollBoardContentVO> enrollBoardList;

	private ArrayList<String> contentList;
	
	public ArrayList<EnrollBoardContentVO> getEnrollBoardList() {
		return enrollBoardList;
	}

	public void setEnrollBoardList(ArrayList<EnrollBoardContentVO> enrollBoardList) {
		this.enrollBoardList = enrollBoardList;
	}

	public ArrayList<String> getContentList() {
		return contentList;
	}
 
	public void setContentList(ArrayList<String> contentList) {
		this.contentList = contentList;
	}

	@Override
	public String toString() {
		return "MultiEnrollBoardContentVO [enrollBoardList=" + enrollBoardList + "]";
	}
	
	
}
