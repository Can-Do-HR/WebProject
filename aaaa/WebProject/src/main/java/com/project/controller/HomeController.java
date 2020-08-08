package com.project.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.product.service.ProductService;
import com.project.product.vo.ProductResultVO;


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