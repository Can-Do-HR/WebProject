package com.project.review.service;

import java.util.ArrayList;
import java.util.List;

import com.project.review.vo.ReviewVO;

public interface ReviewService {

   public int reviewRegist(ReviewVO vo);
   public String reviewBoard();
   public List<ReviewVO> getList();
   //public String reviewWrite();


}