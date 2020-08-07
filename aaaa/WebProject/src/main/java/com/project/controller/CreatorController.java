package com.project.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.creator.VO.EnrollBoardContentVO;
import com.project.creator.VO.EnrollBoardVO;
import com.project.creator.VO.MultiEnrollBoardContentVO;
import com.project.creator.service.CreatorService;
import com.project.util.FileUtil;
import com.project.util.StringUtil;

@Controller
@RequestMapping("/Creator")
public class CreatorController {
	//파일 저장 경로
	private final String creatorFolderPath = "D:\\course\\spring\\upload\\creator";
	
	@Autowired
	CreatorService creatorService;
	
	private FileUtil fileUtil = new FileUtil(); //TODO: bean 생성하기
	private StringUtil stringUtil = new StringUtil();
	private String splitText = "&&bhc&&";
	
	@RequestMapping("/EnrollBoard") //강좌 게시판(접근 권한: 수강생, 크리에이터)
	public String enrollBoard(@RequestParam("pno") String pno, Model model) {
		ArrayList<EnrollBoardVO> enrollList = (ArrayList<EnrollBoardVO>)creatorService.getEnrollList(pno);
		System.out.println(enrollList);
		model.addAttribute("pno", pno);
		model.addAttribute("enrollList", enrollList);
		return "/Creator/EnrollBoard";
	}
	
	@RequestMapping("/EnrollDetail") //강좌 게시판 자세히 보기(접근권한: 수강생, 크리에이터)
	public String enrollDetail(String eno, String pno, Model model) {
		EnrollBoardVO enrollBoardVO = creatorService.getEnrollDetailBoard(eno, pno);
		System.out.println(enrollBoardVO.toString());
		model.addAttribute("enrollBoardVO", enrollBoardVO);
		return "/Creator/EnrollDetail";
	}
	
	@RequestMapping("/EnrollWrite") //강좌 글쓰기 화면(접근권한: 크리에이터)
	public String enrollWrite(String pno, Model model) {
		
		model.addAttribute("pno", pno);
		
		return "/Creator/EnrollWrite";
	}
	
	@RequestMapping("/EnrollBoardRegist") //강좌 업로드  > DB에 가서 EnrollWrite에서 가져온 폼을insert함 (접근권한: 크리에이터)
	public String enrollBoardRegist(EnrollBoardVO enrollBoardVO, 
			  						MultiEnrollBoardContentVO multiEnrollBoardContentVO,
			  						@RequestParam("contentImg") List<MultipartFile> list) {
		int eno = creatorService.getMaxEno() + 1; // eno최고값 가져오기 + 1해서 새 eno를 만듭니다.
		
		System.out.println(multiEnrollBoardContentVO.getEnrollBoardList().get(0).getContentText());
		
		//파일 업로드
		List<String> fileNameList = fileUtil.fileListUpload(list, creatorFolderPath, eno);
		System.out.println(fileNameList);
		
		//multiple row가 좋긴 한데 도무지 뺄 방법이 없어서 야생의 방법으로 빼옵니다. 두 List를 준비해주세요
		List<EnrollBoardContentVO> enrollContentList = multiEnrollBoardContentVO.getEnrollBoardList();
		List<String> contentList = new ArrayList<String>();
		for(int i = 0; i < enrollContentList.size(); i++) {
			contentList.add(enrollContentList.get(i).getContentText()); //vo에서 한땀한땀 뻬옵니다.
		}
		
		//이쁘게 String으로 완성~
		String contentString = stringUtil.makeString(fileNameList, contentList, splitText);
		
		System.out.println(contentString);
		
		//넣습니다. 통짜로 DB에 넣으면 완성~ content를 받아오면서 split해서 안의 리스트에 넣어줍니다.
		enrollBoardVO.setContent(contentString);
		
		creatorService.insertEnrollBoard(enrollBoardVO);
		
		
		return "Redirect://Creator/EnrollBoard";
	}
	
	
	
	@RequestMapping("/EnrollBoardModify") // 강좌 수정페이지(접근권한: 크리에이터)
	public String enrollBoardModify(String eno, String pno, Model model) {
		EnrollBoardVO enrollBoardVO = creatorService.getEnrollDetailBoard(eno, pno);
		model.addAttribute("enrollBoardVO", enrollBoardVO);
		return "/Creator/EnrollModify";
	}
	
	//TODO: 수정폼에서 input 속성 잘 생각하기...
	@RequestMapping("/EnrollBoardModifyUpdate")
	public String enrollBoardModifyUpdate(EnrollBoardVO enrollBoardVO) {
		int eno = enrollBoardVO.getEno();
		int pno = enrollBoardVO.getPno();
		return "redirect:/Creator/EnrollDetail?eno=" + eno + "$pno=?" + pno;
	}
	
	
	//image 전송 REST API

	@RequestMapping(
			value = "/EnrollBoardImg"
			)
	public @ResponseBody byte[] getEnrollBoardImg(String eno, String fileName) throws IOException{
//		InputStream in = getClass().getResourceAsStream(creatorFolderPath + "\\" + eno + "\\" + fileName);
		System.out.println(fileName);
		String imgPath = creatorFolderPath + "\\" + eno + "\\" + fileName; 
		InputStream imgFile = new BufferedInputStream(new FileInputStream(imgPath));
		return IOUtils.toByteArray(imgFile);
	}
	
	
}
