package com.project.product.service;

import java.util.ArrayList;

import com.project.product.VO.ContentVO;
import com.project.product.VO.EnrollVO;
import com.project.product.VO.IntegratedContentVO;
import com.project.product.VO.MultiContentVO;
import com.project.product.VO.ProductResultVO;
import com.project.product.VO.ProductVO;

public interface ProductService {
	
	public int ProductRegist(IntegratedContentVO integratedVO);
	public ProductResultVO getProductInfo(int pno);
	public int ProductGetNextPno();
	
	public int EnrollProduct(EnrollVO enrollVO);
	
	//도혜린씨가 해본거
	//갓ㅡ혜린
	//public int insertProduct(ProductVO productVO);
	//public int insertProductContent(ArrayList<ContentVO> contentVoList);
	

}
