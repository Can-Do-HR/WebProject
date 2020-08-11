package com.project.review.service;

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

   //  후기 게시판 
   @Override
   public String reviewBoard() {

      return sqlsession.selectOne("com.project.review.mapper.ReviewBoard");
   }
   //   후기 작성 
   @Override
   public String reviewWrite() {

      return sqlsession.selectOne("com.project.review.mapper.ReviewWrite");
   }
   //후기 등록 
   @Override
   public int reviewRegist(ReviewVO vo) {

      return sqlsession.insert(mapperPath + "reviewRegist", vo);
   }
   // 
   @Override
   public List<ReviewVO> getList() {

      return sqlsession.selectList(mapperPath + "getList");

   }
   
   @Override
   public ReviewVO getReviewDetail(int rno) {
   
      return sqlsession.selectOne("com.project.review.mapper.getReviewDetail", rno);
   }
   //후기 수정
   @Override
   public String reviewModify() {
      return sqlsession.selectOne("com.project.review.mapper.ReviewBoard");
   }
}