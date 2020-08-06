package com.project.creator.mapper;

import java.util.ArrayList;
import java.util.List;

import com.project.creator.VO.EnrollBoardVO;

public interface CreatorMapper {
	
	public int getMaxEno();
	
	//TODO: pno!
	public int insertEnrollBoard (EnrollBoardVO enrollBoardVO);
	
	public List<EnrollBoardVO> getEnrollList(String pno);
}
