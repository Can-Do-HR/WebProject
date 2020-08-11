package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.user.service.UserService;
import com.project.user.vo.UserVO;
import com.project.util.SessionKeyCode;

/**
 * 
 * @author 김이슬, 변호찬
 *
 */
@Controller
@RequestMapping("/User")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/UserLogin")
	public String UserLogin() {
		return "/User/UserLogin";
	}

	@RequestMapping("CreatorJoin")
	public String CreatorJoin() {
		return "/User/CreatorJoin";
	}

	@RequestMapping("LoginForm")
	public String UserLoginForm(@RequestParam("email") String email,
			@RequestParam("pw") String pw, 
			HttpServletRequest request) {

		//TODO:암호화 구현된거! 지우지마시오!
		//      vo.setPw(UserSha256.encrypt(vo.getPw()));
		//      String inputPw = vo.getPw();
		//      String inputEncryptedPw = UserSha256.encrypt(inputPw);
		//      vo.setPw(inputEncryptedPw);
		//            
		//      System.out.println("로그인에서 친 비밀번호 암호화 : " + inputEncryptedPw);

		UserVO userVO = userService.checkUserEmailAndPw(email, pw);
		userVO.setPw(null);
		System.out.println(userVO);
		
		if(userVO == null) {
			request.setAttribute("msg","로그인실패");
			return "redirect:/User/UserLogin";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute(SessionKeyCode.userKey, userVO);
			session.setAttribute("userVO", userVO);
			System.out.println(session.getAttribute(SessionKeyCode.userKey));
			System.out.println(session.getAttribute("userVO"));
			
			//         System.out.println("세션값 : " + session.getAttribute("name"));

			return "redirect:/";
		}

	}

	//TODO: 뭔갈 햇음
	@RequestMapping("KakaoLogin")
	public String KakaoLogin(HttpServletRequest request,HttpServletResponse response, Model model) {

		String k_name = request.getParameter("name");
		String k_email = request.getParameter("email");

		System.out.println(k_name);
		System.out.println(k_email);

		UserVO vo = new UserVO();
		vo.setEmail(k_email);
		vo.setName(k_name);

		// 이 이메일로 회원등록이 되어있는지 확인한 뒤
		// 있으면 그냥 냅두고 없다면 회원으로 등록. 
		// insert할때 이메일(기본키), 이름, joinType을 kakao로 설정
		int result = userService.idCheck(vo);
		System.out.println("kakao result : " + result);

		if(result == 0) {
			request.setAttribute("msg", "카카오 유저 회원가입 절차를 진행합ㄴ다.");
			response.setContentType("text/html; charset=UTF-8");
			model.addAttribute("k_name",k_name);
			model.addAttribute("k_email",k_email);
			return "/User/UserJoin";
		}

		else {
			HttpSession session = request.getSession();
			session.setAttribute("k_email", k_email);
			session.setAttribute("k_name", k_name);
			return "/home";
		}

	}


	@RequestMapping("/Logout")
	public String UserLogout(HttpSession session) {
		session.invalidate(); //TODO: 로그인 정보 세션만 지우세요.
		return "redirect:/";
	}

	@ResponseBody
	@PostMapping("/emailCheck")
	public int UserIdCheck(@RequestBody UserVO vo) {      //오류잇는지 확인
		int result = userService.idCheck(vo);
		System.out.println("중복여부 : " + result);
		return result;
	}

	@RequestMapping("/UserJoin")
	public String UserJoin() {
		return "/User/UserJoin";
	}

	//vo 부분 가독성있게 userVO를 적어주세요
	@PostMapping("/JoinForm")
	public String UserJoinForm(UserVO vo, RedirectAttributes RA) {

		//      // 암호 확인
		//      System.out.println("암호화전:" + vo.getPw());
		//      // 비밀번호 암호화 (sha256
		//      String encryPassword = UserSha256.encrypt(vo.getPw());//1.받아온값을 암호화
		//      vo.setPw(encryPassword);//2.저장
		//      System.out.println("암호화후:" + vo.getPw());

		//회원가입 메서드
		int result2 = userService.join(vo);//3.저장된 객체 그대로 db로 보냄
		//      System.out.println("controller");
		//      System.out.println(vo.getEmail());
		//      System.out.println(vo.getAddress1());
		//      System.out.println(vo.getAddress2());
		//      System.out.println("controller");
		//      System.out.println("result2 : " + result2);

		if(result2 == 1) {
			RA.addFlashAttribute("msg","회원가입을 축하합니다");
		} else {
			RA.addFlashAttribute("msg","회원가입에 실패했습니다");
		}

		return "redirect:/User/UserLogin";
	}


	@RequestMapping("/Mypage")
	public String UserMypage() {
		return "/User/UserMypage";
	}
	//수정폼 값얻어옴
	@RequestMapping("/UserUpdate")
	public String UserUpdate(HttpSession session, Model model) {
		String email = (String)session.getAttribute("email");

		UserVO userVO = userService.getInfo(email);
		model.addAttribute("UserVO", userVO);

		return "/User/UserUpdate";
	}

	@PostMapping("UpdateForm")
	public String UpdateForm(UserVO vo,HttpSession session,RedirectAttributes RA) {

		//수정
		int result = userService.update(vo);
		System.out.println(result);
		if(result==1) {
			RA.addFlashAttribute("msg","정보가 수정되었습니다");

		}else {
			RA.addFlashAttribute("msg","정보수정이 실패 되었습니다");
		}

		return "redirect:/User/UserUpdate";
	}

	@ResponseBody
	@PostMapping("/pwCheck")
	public int pwCheck(@RequestBody UserVO vo) {      
		int result = userService.pwCheck(vo);
		System.out.println("일치여부 : " + result);
		return result;
	}

	//TODO: 이름 delete > UserDelete로 직관적으로 바꿨는데 못찾겠어요ㅠ
	@PostMapping("/UserDelete")
	public String UserDelete(UserVO userVO,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO MyuserVO = (UserVO) session.getAttribute(SessionKeyCode.userKey);
		UserVO resultVO = userService.checkUserEmailAndPw(MyuserVO.getEmail(), userVO.getPw());
		if(resultVO != null) {
			userService.delete(MyuserVO.getEmail());
		}else {
			session.removeAttribute(SessionKeyCode.userKey);
			request.setAttribute("msg", "탈퇴에 실패했습니다.");
			return "redirect:/User/UserUpdate";
		}

		return "redirect:/User/UserLogin";
	}

	@PostMapping("/PermissionChange")
	public String permissionChange(@RequestParam("email") String email, 
								   HttpServletRequest request) {
		UserVO userVO = (UserVO) request.getSession().getAttribute(SessionKeyCode.userKey);
		if(userVO.getPermission().equals("creator")) {
			return "Creator/MyCreatorPage"; //TODO: 이거 상의해야함
		}
		if(userVO.getEmail().equals(email)) {
			userService.permissionChange(userVO.getUno());
			return "Creator/MyCreatorPage";
			} else {
				return "/";
			}
	}
	
	
	@RequestMapping("/UserModifyPw")
	public String  UserModifyPw() {
		return "/User/UserModifyPw";
	}

	//비번찾기 폼
	@RequestMapping("emailForm")
	public String emailForm() {

		return "/User/UserModifyPw";
	}

	@PostMapping("emailForm.do")
	public void findPw(@ModelAttribute UserVO vo,HttpServletResponse response) throws Exception {
		userService.findPw(vo,response);

	}





}