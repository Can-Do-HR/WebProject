package com.project.creator.service;

import java.util.ArrayList;
import java.util.List;

import com.project.creator.VO.EnrollBoardVO;

public interface CreatorService {
	
	public int getMaxEno();
	public int insertEnrollBoard(EnrollBoardVO enrollBoardVO);
	
	public List<EnrollBoardVO> getEnrollList(String pno);
	
	public EnrollBoardVO getEnrollDetailBoard(String pno, String eno);
	
}
