package com.project.creator.vo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.project.util.StringUtil;

import lombok.Data;

@Data
public class EnrollBoardVO {
	//정적인 폼
	private int eno;
	private int pno;
	private String title;
	private String writer;
	private ArrayList<String> fileNameList;
	private ArrayList<String> contentList;
	private Timestamp regdate;
	
	//동적인 폼을 스트링으로 가져온 것
	private String content;
	
	private StringUtil stringUtil = new StringUtil();

	public void setContent(String content) {
		this.content = content;
		Map<String, List<String>> map = stringUtil.makeList(content, "&&bhc&&");
		
		this.contentList = (ArrayList<String>) map.get("contentList");
		this.fileNameList = (ArrayList<String>) map.get("fileNameList");
	}

	
	
}