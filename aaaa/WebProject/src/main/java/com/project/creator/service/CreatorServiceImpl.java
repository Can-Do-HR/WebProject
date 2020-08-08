package com.project.creator.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.creator.vo.EnrollBoardVO;
import com.project.product.vo.IntegratedContentVO;


@Service("creatorService")
public class CreatorServiceImpl implements CreatorService{

	@Autowired
	private SqlSession sqlsession;
	
	private String mapperPath = "com.project.creator.mapper";
	
//	@Override
//	public int ProductRegist(IntegratedContentVO integratedVO) {
//		//return productDAO.ProductRegist(integratedVO);
//		return sqlsession.insert("com.project.product.mapper.ProductRegist",integratedVO);
//	}
	
	@Override
	public int getMaxEno() {
		int eno = sqlsession.selectOne(mapperPath + ".getMaxEno");
		return eno;
	}
	
	@Override
	public int insertEnrollBoard(EnrollBoardVO enrollBoardVO) {
		return sqlsession.insert(mapperPath + ".insertEnrollBoard", enrollBoardVO);
	}
	
	@Override
	public List<EnrollBoardVO> getEnrollList(String pno) {
		
		List<EnrollBoardVO> resultList = sqlsession.selectList(mapperPath + ".getEnrollList", pno);
		
		return resultList;
	}
	
	@Override
	public EnrollBoardVO getEnrollDetailBoard(String eno, String pno) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("pno", pno);
		map.put("eno", eno);
		return sqlsession.selectOne(mapperPath + ".getEnrollDetailBoard", map);
	}
	
}
