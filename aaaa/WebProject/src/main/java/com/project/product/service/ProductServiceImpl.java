package com.project.product.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.product.VO.ContentVO;
import com.project.product.VO.EnrollVO;
import com.project.product.VO.IntegratedContentVO;
import com.project.product.VO.MultiContentVO;
import com.project.product.VO.ProductResultVO;
import com.project.product.VO.ProductVO;

@Service("ProductService")
public class ProductServiceImpl implements ProductService{

	
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int ProductRegist(IntegratedContentVO integratedVO) {
		//return productDAO.ProductRegist(integratedVO);
		return sqlsession.insert("com.project.product.mapper.ProductRegist",integratedVO);
	}

	@Override
	public ProductResultVO getProductInfo(int pno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.project.product.mapper.getProductInfo",pno);
	}
	
	@Override
	public int ProductGetNextPno() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.project.product.mapper.ProductGetNextPno");
	}
	

	@Override
	public int EnrollProduct(EnrollVO enrollVO) {
		return sqlsession.insert("com.project.product.mapper.enrollProduct",enrollVO);
	}

	
	
	
	//이하 도혜린
//	@Override
//	public int insertProduct(ProductVO productVO) {
//		int result = 0;
//		result = sqlsession.insert("com.project.product.mapper.ProductRegist",productVO);
//		return result;
//	}
//	
//	@Override
//	public int insertProductContent(ArrayList<ContentVO> contentVoList) {
//		int result = -1;
//		for(int i = 0; i < contentVoList.size(); i++) {
//			result = sqlsession.insert("com.project.product.mapper.ProductListRegist", contentVoList.get(i));
//			if(result == 0) return result;
//		}
//		return result;
//	}
	
	

}
