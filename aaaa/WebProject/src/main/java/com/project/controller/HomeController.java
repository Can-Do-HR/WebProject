package com.project.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hee.heechart.VO.MultiVO;
import com.hee.heechart.VO.MultiVO2;


@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
		
		
		return "home";
	}
	
	@RequestMapping(value = "/test")
	public String test() {
		return "test";
	}
	
	@RequestMapping(value = "/testForm")
	public String testForm(MultiVO vo, MultiVO2 vo2) {
		
		System.out.println(vo.getList().size());
		
		System.out.println(vo.getList().get(0).getAaa());
		System.out.println(vo.getList().get(0).getBbb());
		System.out.println(vo.getList().get(0).getCcc());
		
		System.out.println(vo.getList().get(1).getAaa());
		System.out.println(vo.getList().get(1).getBbb());
		System.out.println(vo.getList().get(1).getCcc());
		
		System.out.println(vo.getList().get(2).getAaa());
		System.out.println(vo.getList().get(2).getBbb());
		System.out.println(vo.getList().get(2).getCcc());
		
		System.out.println("========================");
		
		System.out.println(vo2.getList2().get(0).getAaa());
		System.out.println(vo2.getList2().get(0).getBbb());
		System.out.println(vo2.getList2().get(0).getCcc());
		
		System.out.println(vo2.getList2().get(1).getAaa());
		System.out.println(vo2.getList2().get(1).getBbb());
		System.out.println(vo2.getList2().get(1).getCcc());
		
		System.out.println(vo2.getList2().get(2).getAaa());
		System.out.println(vo2.getList2().get(2).getBbb());
		System.out.println(vo2.getList2().get(2).getCcc());
		
		
		
		return null;
	}
	
}
