package com.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.project.user.VO.UserVO;
import com.project.user.service.UserService;

@Controller
@RequestMapping("/User")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("Login")
	public String UserLogin() {
		return "/User/UserLogin";
	}
	
	@RequestMapping("LoginForm")
	public String UserLoginForm(UserVO vo, HttpSession session, RedirectAttributes RA) {
		
		int result = userService.login(vo);
		System.out.println("login result : " + result);
		
		System.out.println("email : " + vo.getEmail());
		System.out.println("pw : " + vo.getPw());
		
		if(result == 0) {
			System.out.println("아이디나 비밀번호를 확인해주세요");
			return "redirect:/User/Login";
		} else {
			
			UserVO userVO = userService.getInfo(vo.getEmail());
			
			System.out.println("로그인 성공");
			
			session.setAttribute("email", userVO.getEmail());
			session.setAttribute("name", userVO.getName());
			
			System.out.println("세션값 : " + session.getAttribute("name"));
			
			return "redirect:/";
		}
		
	}
	
	
	@RequestMapping("KakaoLogin")
	public String KakaoLogin(HttpServletRequest request) {
		
		String k_name = request.getParameter("name");
		String k_email = request.getParameter("email");
		
		System.out.println(k_name);
		System.out.println(k_email);
		
		// 이 이메일로 회원등록이 되어있는지 확인한 뒤
		// 있으면 그냥 냅두고 없다면 회원으로 등록. 
		// insert할때 이메일(기본키), 이름, joinType을 kakao로 설정
		int result = userService.idCheck(k_email);
		System.out.println("kakao result : " + result);
		
		if(result == 0) {
			UserVO uservo = new UserVO(k_email, k_name, "-", "-", "-", "-", "-",null);
			int result2 = userService.kakaoJoin(uservo);
			
			System.out.println("result2 : " + result2);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("k_email", k_email);
		session.setAttribute("k_name", k_name);
		
		return "/home";
	}
	
	
	@RequestMapping("LogOut")
	public String UserLogOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping("Join")
	public String UserJoin() {
		return "/User/UserJoin";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int userIdCheck(@RequestBody String email) {		//오류잇는지 확인
		 int result = userService.idCheck(email);
		 
		 System.out.println("중복여부 : " + result);
		 
		return result;
	}
	
	
	@RequestMapping("JoinForm")
	public String UserJoinForm(UserVO vo, RedirectAttributes RA) {
		
		//회원가입 폼에 이메일 중복검사 넣어야함 
		
		int result2 = userService.join(vo);
		System.out.println("controller");
		System.out.println(vo.getEmail());
		System.out.println(vo.getAddress1());
		System.out.println(vo.getAddress2());
		System.out.println("controller");
		System.out.println("result2 : " + result2);
		
		if(result2 == 1) {
			RA.addFlashAttribute("msg","회원가입을 축하합니다");
		} else {
			RA.addFlashAttribute("msg","회원가입에 실패했습니다");
		}
		
		return "redirect:/home";
	}
	
	@RequestMapping("Mypage")
	public String UserMypage() {
		return "/User/UserMypage";
	}
	
	
	@RequestMapping("CreatorJoin")
	public String CreatorJoin() {
		return "/User/CreatorJoin";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("upload")
	public String Userupload() {
		return "/User/upload";
	}
	
	
	@RequestMapping("uploadForm") 
	public String upload(MultipartHttpServletRequest mtf, Model model) throws Exception { 
		
		
		System.out.println("upload");
		System.out.println("upload");
		System.out.println("upload");
		
		// 파일 태그 
		String fileTag = "file"; 
		
		// 업로드 파일이 저장될 경로 
		String filePath = "D:\\course\\project-img-storage" + "\\"; 		//경로 한단계 상위로 들어가서 \\한번 더 붙여줌
		//String filePath = "D:\\course\\Spring-hoho\\spring\\test2\\src\\main\\webapp\\resources\\img" + "\\";
		
		// 파일 이름 
		MultipartFile file = mtf.getFile(fileTag); 
		String fileName = file.getOriginalFilename(); 		//파일 이름 지정
		
		// 파일 전송 
		try { 
			file.transferTo(new File(filePath + fileName)); 
			
			
			int result = userService.imgUpload(filePath + fileName);
			System.out.println("result : " + result);
			System.out.println(filePath + fileName);
			
			model.addAttribute("img",filePath + fileName);
			
		} catch(Exception e) { 
			System.out.println("업로드 오류"); 
		} 
		
		return "/User/uploadResult";

	}
	
	
	@RequestMapping("uploadResult")
	public String UseruploadResult() {
		return "/User/uploadResult";
	}
	
	
	
	@RequestMapping("fileupload.do")
	public void imageUpload(HttpServletRequest request,HttpServletResponse response, @RequestParam MultipartFile upload) {
			
		
			OutputStream out = null;
			PrintWriter printWriter = null;

			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			
			
			System.out.println("들어왓다1");

			try {
				//CKEDITOR에서 업로드된 파일의 이름을 참조
				String fileName = upload.getOriginalFilename();
				System.out.println("들어왓다2");
				
				//CKEDITOR에서 업로드된 파일을 byte 배열로 참조
				byte[] bytes = upload.getBytes(); /*이미지 포함 모든 데이터는 바이트*/
				System.out.println("들어왓다3");

				//실제 업로드 될 톰캣서버의 물리적 경로
				HttpSession session = request.getSession();
				System.out.println("들어왓다4");
				String root_path = session.getServletContext().getRealPath("/");
				System.out.println("들어왓다5");

				
				//실서버 톰캣 스왑시 주석변경
				String uploadPath =root_path+"resources\\upload\\ckeditor\\" + fileName; //윈도우
				//String uploadPath =root_path+"resources/upload/ckeditor/" + fileName; //리눅스
				System.out.println("들어왓다6");

				System.out.println(uploadPath);

				//C:\\swk\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\chaumi\\resources\\upload\\
//출력스트객체 생성(파일생성)

				out = new FileOutputStream(new File(uploadPath)); /* 빈폴더 생성*/
				System.out.println("들어왓다7");

				//업로드된 파일의 바이트배열을 출력스트림에 사용.
				out.write(bytes); /*실제 파일에대한 정보를 담고있음*/
				out.flush();

				
				String callback = request.getParameter("CKEditorFuncNum");
				System.out.println("들어왓다8");

				printWriter = response.getWriter(); ///responese 서버측에서 클라이언트로 정보를 보내고자 할때 그역활을 담당하는 객체...

				//CKEDITOR 에 업로드 된 서버측의 파일경로를 반환하는 목적
				
				String fileUrl = "/upload/ckeditor/" + fileName;   ///resources/upload/ + fileName
				//String fileUrl = "D:\\course\\Spring-hoho\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\test2\\resources\\upload\\ckeditor" + fileName;

				

				
				
				System.out.println(fileUrl+"fileUrl");
				System.out.println("들어왓다9");

				printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");

				printWriter.flush();

				System.out.println("들어왓다10");

			} catch (IOException e) {

				e.printStackTrace();

			} finally {

				try {

					if ( out != null) {

						out.close();

					}

					if (printWriter != null) {

						printWriter.close();

					}

				}catch(IOException e) {

					e.printStackTrace();

				}

			}

			

			return;

			

		}

	
	
	
}
