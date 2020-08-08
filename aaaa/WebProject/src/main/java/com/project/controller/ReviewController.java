package com.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.review.service.ReviewService;
import com.project.review.vo.ReviewVO;
import com.project.util.ReviewPageVO;

@Controller
@RequestMapping("/Review")
public class ReviewController {
   
   @Autowired
   private ReviewService reviewService; 
   
   //리뷰자세히 보기
   @GetMapping("/ReviewDetail")
   public String ReviewDetail() {
      return "/Review/ReviewDetail";
   }
   //리뷰 작성
   @RequestMapping("/ReviewWrite")
   public String ReviewWrite() {//값이 들어온거를 등록합니다. :-)
      
      return "/Review/ReviewWrite"; 
   }
   
   
   
   //리뷰 등록
   @RequestMapping("/ReviewRegist")
   public String ReviewRegist(ReviewVO vo) {
//      int result = -1; 
      
      System.out.println(vo.toString());
      reviewService.reviewRegist(vo);
      
      return "redirect:/Review/ReviewBoard";
   }
   //수강 후기
   @GetMapping("/ReviewBoard")
   public String ReviewBoard(HttpServletRequest request,Model  model, 
		   					 @RequestParam("pno") String pno) {
//      int pno1 = Integer.valueOf(request.getParameter("product"));
      ArrayList<ReviewVO> list =  (ArrayList<ReviewVO>)reviewService.getList();
      System.out.println(list.toString());
      
      model.addAttribute("list",list);
      
      return "/Review/ReviewBoard"; 
   }
   
  
   
}