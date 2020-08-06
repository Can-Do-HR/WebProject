package com.project.product.mapper;

import com.project.product.VO.EnrollVO;
import com.project.product.VO.ProductResultVO;
import com.project.product.VO.ProductVO;

public interface ProductMapper {
	
	public int ProductRegist(ProductVO vo);
	public ProductResultVO getProductInfo(int pno);
	public int ProductGetNextPno();
	
	public int EnrollProduct(EnrollVO enrollVO);

}
