package com.project.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hee.heechart.VO.MultiVO;
import com.hee.heechart.VO.MultiVO2;
import com.project.product.VO.ProductResultVO;
import com.project.product.service.ProductService;


@Controller
public class HomeController {
   
   @Autowired
   ProductService productService;
   
   
   @RequestMapping(value = "/")
   public String home(Locale locale, Model model) {
      
      ArrayList<ProductResultVO> allProductList = (ArrayList<ProductResultVO>)productService.getAllProductList();
      model.addAttribute("allProductlist",allProductList);
      
      return "home";
   }
   
   
   
}