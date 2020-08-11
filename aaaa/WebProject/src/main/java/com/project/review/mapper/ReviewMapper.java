package com.project.review.mapper;

import java.util.List;

import com.project.review.vo.ReviewVO;
import com.project.util.Criteria;

public interface ReviewMapper {
   public String reviewBoard();
   public String reviewWrite();
   //TODO: pno 들어오면 쿼리 수정해주세요~
   public int reviewRegist(ReviewVO vo);
   public List<ReviewVO> getList();
   public ReviewVO getReviewDetail(int rno);
   public String reviewModify();
}