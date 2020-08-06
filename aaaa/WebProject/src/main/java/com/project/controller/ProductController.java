package com.project.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.product.VO.EnrollVO;
import com.project.product.VO.IntegratedContentVO;
import com.project.product.VO.MultiContentVO;
import com.project.product.VO.MultiQnAVO;
import com.project.product.VO.ProductResultVO;
import com.project.product.VO.ProductVO;
import com.project.product.VO.QnAVO;
import com.project.product.service.ProductService;

@Controller
@RequestMapping("/Product")
public class ProductController {

	@Autowired
	ProductService productService;
	
	public static final String uploadFolder = "D:\\course\\spring\\upload\\board\\";


	@RequestMapping("ProductWrite")
	public String creatorBoard() {
		//강좌 등록 화면
		return "/Product/ProductWrite";
	}

	@RequestMapping("ProductRegist")
	public String ProductRegist(ProductVO productVO,
			MultiContentVO multicontentVO, MultiQnAVO multiqnaVO,
			@RequestParam("thumb") MultipartFile thumb,
			@RequestParam("ContentImg") List<MultipartFile> list
													 
			) {
		
		
		//, @RequestParam("thumbnail") MultipartFile thumb 
		//, @RequestParam("ContentImg") List<MultipartFile> list
		//여기서 할려는게 upload폴더 안에 "강좌 번호(pno)로 하위 폴더를 만들어서" 글에 포함된 이미지를 저장하는것입니다
		//근데 글을 쓸 당시에는 강좌번호(pno)가 없으므로 폴더를 만들 수도 없어요
		//그래서 productService.ProductGetNextPno()를 호출을 하는데 이것은
		//DB에서 현재 가장 높은 강좌번호를 얻는 메소드입니다. 강좌 등록시에는 여기다가 1을 더해서 글번호로 삼고 폴더를 만들어 이미지를 저장합니다.
		int NextPno = 0;
		try {
		NextPno = productService.ProductGetNextPno();
		} catch(Exception e) {
			e.printStackTrace();
		}
		String NextPnoFolder = String.valueOf(NextPno+1);
		
		//File newFolder = new File("D:\\course\\spring\\upload\\" + (NextPno+1));	
		File newFolder = new File(uploadFolder + NextPnoFolder);	
		newFolder.mkdir();
		

		
		
		try {
			String fileRealName = thumb.getOriginalFilename(); //실제파일명
			
			File ThumbNailFolder = new File(uploadFolder + NextPnoFolder + "\\thumbnail");
			ThumbNailFolder.mkdir();
			
			File saveFile = new File(uploadFolder + NextPnoFolder + "\\thumbnail\\" + fileRealName );
			thumb.transferTo(saveFile); //실제 파일을 저장해주는 메서드 filewriter작업을 손쉽게 해주는 스프링 메서드
			
			productVO.setThumbnail(uploadFolder + NextPnoFolder + "\\thumbnail\\" + fileRealName);
			
			//System.out.println("thumb : "  + productVO.getThumbnail());
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

		try {
			
			File ContentImgFolder = new File(uploadFolder + NextPnoFolder + "\\contentImg");
			ContentImgFolder.mkdir();

			for(int i = 0; i < list.size(); i++) {

				System.out.println("i : " + i);
				String fileRealName = list.get(i).getOriginalFilename(); //파일실제이름
				String fileExtension = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );


				fileRealName = String.valueOf(i+1);
				fileRealName += fileExtension;

				File saveFile = new File(uploadFolder + NextPnoFolder + "\\contentImg\\" + fileRealName);
				list.get(i).transferTo(saveFile); //실제 파일을 저장


				multicontentVO.getContentList().get(i).setContentImgBox(uploadFolder + NextPnoFolder + "\\contentImg\\" + fileRealName);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		for(int i = 0; i < multiqnaVO.getQnAList().size(); i++) {
			System.out.println(multiqnaVO.getQnAList().get(i));
		}
		IntegratedContentVO integratedVO = new IntegratedContentVO(productVO, multicontentVO, multiqnaVO);

		System.out.println("thumbnail : " + productVO.getThumbnail());


		int result = productService.ProductRegist(integratedVO);
		

		return "/Product/ProductWrite";
	}

	@RequestMapping("ProductDetail")
	public String ProductDetail(HttpServletRequest request, Model model) {
		
		System.out.println("");
		System.out.println("탓다고");


		int pno = Integer.parseInt(request.getParameter("product"));


		ProductResultVO productResultVO = productService.getProductInfo(pno);




		String contentStr = productResultVO.getContents();
		String[] contentList = contentStr.split("&&bhc&&");
		
		for(int i = 0; i<contentList.length; i++) {
			System.out.println(contentList[i]);
		}

		ArrayList<String> contentImgList = new ArrayList<String>();
		ArrayList<String> contentTextList = new ArrayList<String>();
		for(int i = 0; i < contentList.length-1; i++) {
			contentImgList.add(contentList[i]);
			
			i++;
			contentTextList.add(contentList[i]);
		}


		String QnAStr = productResultVO.getQnA();
		String[] QnAList = QnAStr.split("&&bhc_qna&&");

		ArrayList<String> qnaQList = new ArrayList<String>();
		ArrayList<String> qnaAList = new ArrayList<String>();
		for(int i = 0; i < QnAList.length-1; i++) {
			qnaQList.add(QnAList[i]);
			i++;
			qnaAList.add(QnAList[i]);
		}


		System.out.println("contentImgList : " + contentImgList.toString());
		System.out.println("contentImgList : " + contentTextList.toString());





		model.addAttribute("productVO",productResultVO);
		model.addAttribute("contentImgList",contentImgList.size());
		model.addAttribute("contentTextList",contentTextList);
		model.addAttribute("qnaQList",qnaQList);
		model.addAttribute("qnaAList",qnaAList);
		//model.addAttribute("ImgList",ImgList);

		return "/Product/ProductDetail";
	}


	


	//강의 등록							//권한 필터 필요
	@RequestMapping("enrollProduct")	//중간 절차없이 신청누르면 바로 신청됨 (추후 수정 필요)
	public String enrollProduct(HttpServletRequest request) {

		String email="";

		HttpSession session = request.getSession();
		if(session.getAttribute("email")==null || session.getAttribute("k_email")!=null) {
			email = (String)session.getAttribute("k_email");

		} else if (session.getAttribute("email")!=null || session.getAttribute("k_email")==null) {
			email = (String)session.getAttribute("email");

		} else if (session.getAttribute("email")==null || session.getAttribute("k_email")==null) {
			System.out.println("권한 체크나 해라");
			return "/";
		}

		int pno = Integer.valueOf(request.getParameter("pno"));
		EnrollVO enrollVO = new EnrollVO(pno, email);
		int result = productService.EnrollProduct(enrollVO);
		System.out.println("enrollProduct result: " + result);
		return "/Product/CreatorBoardTestResult?product=" + pno;
	}



}
