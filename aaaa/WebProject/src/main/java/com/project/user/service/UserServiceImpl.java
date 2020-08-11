package com.project.user.service;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.user.mapper.UserMapper;
import com.project.user.vo.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int join(UserVO vo) {
		//return userDAO.join(vo);
		return sqlsession.insert("com.project.user.mapper.join",vo);
	}
	
	@Override
	public int kakaoJoin(UserVO vo) {
		return sqlsession.insert("com.project.user.mapper.kakaoJoin",vo);
	}

	@Override
	public UserVO checkUserEmailAndPw(String email, String pw) {
		//return userDAO.login(vo);
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pw", pw);
		System.out.println(map);
		return sqlsession.selectOne("com.project.user.mapper.checkUserEmailAndPw",map);
	}
	
	@Override
	public UserVO getInfo(String email) {
		//return userDAO.getInfo(email);
		return sqlsession.selectOne("com.project.user.mapper.getInfo",email);
	}
	
	
	@Override
	public int update(UserVO vo) {
		
		return sqlsession.update("com.project.user.mapper.update",vo);
	}
	
	@Override
	public int idCheck(UserVO vo) {
		//return userDAO.idCheck(vo);
		return sqlsession.selectOne("com.project.user.mapper.idCheck",vo);
	}

	@Override
	public int pwCheck(UserVO vo) {
		return sqlsession.selectOne("com.project.user.mapper.pwCheck",vo);
	}

	@Override
	public int delete(String email) {
		
		return sqlsession.delete("com.project.user.mapper.delete", email);
	}

	@Override
	public int updatePw(UserVO vo) throws Exception {
		//return userDAO.updatePw(vo);
		return sqlsession.update("com.project.user.mapper.updatePw", vo);
	}

	@Override
	public void sendEmail(UserVO vo,String div) {
				// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";		
				String hostSMTPid = "ttl7668@naver.com"; // 본인의 아이디 입력		
				String hostSMTPpwd = ""; // 비밀번호 입력
				
				// 보내는 사람 EMail, 제목, 내용 
				String fromEmail = "ttl7668@naver.com"; // 보내는 사람 eamil
				String fromName = "joker";  // 보내는 사람 이름
				String subject = ""; // 제목
				String msg="";
				
				if(div.equals("findPw")) {
					// 메일 내용
					subject = "Spring Homepage 임시 비밀번호입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color: blue;'>";
					msg += vo.getName() + "님의 임시비밀번호입니다.비밀번호를 변경하세요.</h3>";
					msg += "<p>임시 비밀번호:";
					msg += vo.getPw()+"</p></div>";			
				}
								
				// 받는 사람 E-Mail 주소
				String mail = vo.getEmail(); // 받는 사람 email		
				
				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(587);	// SMTP 포트 번호 입력

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg("<p>이메일 발송 테스트 입니다.</p>"); // 본문 내용
					email.send();			
				} catch (Exception e) {
					System.out.println("메일발송실패:"+e);
					System.out.println(vo.getEmail());
				}
	}


		@Override
		public void findPw(UserVO vo,HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
				//임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				vo.setPw(pw);
				// 비밀번호 변경
				//TODO: user> 언니 체크해주세요
//				userDAO.updatePw(vo); //null값
				// 비밀번호 변경 메일 발송
				
				sendEmail(vo, "findPw");
				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				System.out.println("메일발송");

			
		}

		@Override
		public int permissionChange(int pno) {
			return sqlsession.update("com.project.user.mapper.permissionChange", pno);
		}

	
	

//	@Override
//	public void approvalUser(UserVO vo) {
////		response.setContentType("text/html;charset=utf-8");
////		PrintWriter out = response.getWriter();
//		if (userDAO.approvalUser(vo)== 0) { // 이메일 인증에 실패하였을 경우
////			out.println("<script>");
////			out.println("alert('잘못된 접근입니다.');");
////			out.println("history.go(-1);");
////			out.println("</script>");
////			out.close();
//			System.out.println("실패");
//		} else { // 이메일 인증을 성공하였을 경우
////			out.println("<script>");
////			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
////			out.println("location.href='../index.jsp';");
////			out.println("</script>");
////			out.close();
//			userDAO.approvalUser(vo);
//			System.out.println("성공");
//		}
//		
//	}
	
	

//	@Override
//	public String createKey() {
//		String key = "";
//		Random rd = new Random();
//
//		for (int i = 0; i < 8; i++) {
//			key += rd.nextInt(10);
//		}
//		return key;
//	}

}





	

	

