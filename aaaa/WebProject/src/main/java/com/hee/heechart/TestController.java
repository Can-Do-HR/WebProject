package com.hee.heechart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hee.heechart.VO.TestVO;

@Controller
@RequestMapping("/")
public class TestController {
	
      
      @Autowired
      TestService TestService;
      
      @RequestMapping(value ="do")
      public String goTestPage(Model model, HttpServletRequest request){
            
            //String testInput = (String)request.getParameter("testInput");
            TestVO testVO = new TestVO();
            //testVO.setTestInput(Integer.parseInt(testInput));
            
            List<TestVO> list = TestService.getTestValue(testVO);
            
            System.out.println(list.get(0).getTestInput());
            System.out.println(list.get(0).getTestOutput());
            
            TestService.TestInsert(testVO);
            
            
            if( list.size() > 0 ){
                  model.addAttribute("output", "Success_DB_Connection");
                  model.addAttribute("vo", testVO);
                  model.addAttribute("list",list.toString());
            }else{
                  model.addAttribute("output", "Fail_DB_Connection");
            }
            
            return "test";
      }
      
      @RequestMapping(value="home")
      public String home() {
    	  System.out.println("11");
    	  return "home";
      }
      
      @RequestMapping(value="Mypage")
      public String Mypage() {
    	  System.out.println("11");
    	  return "Mypage";
      }
      
      @RequestMapping(value="CreatorApply")
      public String CreatorApply() {
    	  System.out.println("11");
    	  return "CreatorApply";
      }
}

