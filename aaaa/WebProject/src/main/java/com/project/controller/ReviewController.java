package com.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.review.vo.ReviewVO;
import com.project.review.service.ReviewService;

@Controller
@RequestMapping("/Review")
public class ReviewController {
   
   @Autowired
   private ReviewService reviewService; 
   
   //리뷰 등록
   @RequestMapping("/ReviewRegist")
   public String ReviewRegist(ReviewVO vo) {
//      int result = -1; 
      
      System.out.println(vo.toString());
      reviewService.reviewRegist(vo);
      
      return "redirect:/Review/ReviewBoard";
   }
   //수강 후기
   @RequestMapping("/ReviewBoard")
   public String ReviewBoard(HttpServletRequest request,Model  model) {
//      int pno1 = Integer.valueOf(request.getParameter("product"));
      ArrayList<ReviewVO> list =  (ArrayList<ReviewVO>)reviewService.getList();
      System.out.println(list.toString());
      
      model.addAttribute("list",list);
      
      return "/Review/ReviewBoard"; 
   }
   //리뷰자세히 보기
   @RequestMapping("/ReviewDetail")
   public String getDetail(@RequestParam("rno") int rno,
                         Model model
         ) {
    ReviewVO vo = reviewService.getReviewDetail(rno);
    System.out.println(vo.getContent());
    System.out.println(vo.getTitle());
    System.out.println(vo.getWriter() );
    model.addAttribute("reviewVO", vo);
      return "/Review/ReviewDetail";
   }
   //리뷰 작성
   @RequestMapping("/ReviewWrite")
   public String ReviewWrite() {
      System.out.println("여기가 리뷰 라이트라고 ");
      return "/Review/ReviewWrite"; 
   }
   
   @RequestMapping("/ReviewModify")
   public String ReviewModify() {
      
      return "/Review/ReviewModify";
   }
   
}