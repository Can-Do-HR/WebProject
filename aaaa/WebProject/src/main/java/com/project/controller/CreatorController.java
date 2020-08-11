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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.creator.service.CreatorService;
import com.project.creator.vo.EnrollBoardContentVO;
import com.project.creator.vo.EnrollBoardVO;
import com.project.creator.vo.MultiEnrollBoardContentVO;
import com.project.util.FilePath;
import com.project.util.FileUtil;
import com.project.util.StringUtil;

@Controller
@RequestMapping("/Creator")
public class CreatorController {
	
	@Autowired
	CreatorService creatorService;
	
	private FileUtil fileUtil = new FileUtil();
	
	@GetMapping("/EnrollBoard") //강좌 게시판(접근 권한: 수강생, 크리에이터)
	public String enrollBoard(@RequestParam("pno") String pno, Model model) {
		ArrayList<EnrollBoardVO> enrollList = (ArrayList<EnrollBoardVO>)creatorService.getEnrollList(pno);
		System.out.println(enrollList);
		model.addAttribute("pno", pno);
		model.addAttribute("enrollList", enrollList);
		return "/Creator/EnrollBoard";
	}
	
	@GetMapping("/EnrollDetail") //강좌 게시판 자세히 보기(접근권한: 수강생, 크리에이터)
	public String enrollDetail(String eno, String pno, Model model) {
		EnrollBoardVO enrollBoardVO = creatorService.getEnrollDetailBoard(eno, pno);
		model.addAttribute("enrollBoardVO", enrollBoardVO);
		return "/Creator/EnrollDetail";
	}
	
	@GetMapping("/EnrollWrite") //강좌 글쓰기 화면(접근권한: 크리에이터)
	public String enrollWrite(String pno, Model model) {
		model.addAttribute("pno", pno);
		return "/Creator/EnrollWrite";
	}
	
	@RequestMapping("/EnrollBoardRegist") //강좌 업로드  > DB에 가서 EnrollWrite에서 가져온 폼을insert함 (접근권한: 크리에이터)
	public String enrollBoardRegist(EnrollBoardVO enrollBoardVO, 
			  						@RequestParam("contentImg") List<MultipartFile> contentImgList) {
		int eno = creatorService.getMaxEno() + 1;
		fileUtil.fileListUpload(contentImgList, FilePath.boardPath, eno);
		creatorService.insertEnrollBoard(enrollBoardVO);
		return "redirect:/Creator/EnrollBoard";
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
	
	
	@RequestMapping("/EnrollBoardImg")
	public @ResponseBody byte[] getEnrollBoardImg(String eno, String fileName) throws IOException{
//		InputStream in = getClass().getResourceAsStream(creatorFolderPath + "\\" + eno + "\\" + fileName);
		System.out.println(fileName);
		String imgPath = FilePath.boardPath + "\\" + eno + "\\" + fileName; 
		InputStream imgFile = new BufferedInputStream(new FileInputStream(imgPath));
		return IOUtils.toByteArray(imgFile);
	}
	
	
}
