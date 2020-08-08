package com.project.review.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
   

   private String mapperPath = "com.project.review.mapper.";
   @Autowired
   private SqlSession sqlsession;
   
   
   @Override
   public String reviewBoard() {
      
      return sqlsession.selectOne("com.project.review.mapper.ReviewBoard");
   }
//   
//   @Override
//   public String reviewWrite() {
//   
//      return sqlsession.selectOne("com.project.review.mapper.ReviewWrite");
//   }

   @Override
   public int reviewRegist(ReviewVO vo) {
      
      return sqlsession.insert(mapperPath + "reviewRegist", vo);
   }

   @Override
   public List<ReviewVO> getList() {
      return sqlsession.selectList(mapperPath + "getList");
   }
}