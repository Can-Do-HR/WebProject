package com.project.product.service;

import java.util.ArrayList;
import java.util.List;

import com.project.product.vo.ContentVO;
import com.project.product.vo.EnrollVO;
import com.project.product.vo.IntegratedContentVO;
import com.project.product.vo.MultiContentVO;
import com.project.product.vo.ProductResultVO;
import com.project.product.vo.ProductVO;

public interface ProductService {
   
   public int ProductRegist(IntegratedContentVO integratedVO);
   public ProductResultVO getProductInfo(int pno);
   public int ProductGetNextPno();

   public List<ProductResultVO> getAllProductList();
   
   public int EnrollProduct(EnrollVO enrollVO);
   
   //도혜린씨가 해본거
   //갓ㅡ혜린
   //public int insertProduct(ProductVO productVO);
   //public int insertProductContent(ArrayList<ContentVO> contentVoList);
   

}