package com.project.user.service;


import javax.servlet.http.HttpServletResponse;

import com.project.user.vo.UserVO;

public interface UserService {
	public int join(UserVO vo);//회원가입처리
	public int kakaoJoin(UserVO vo);//카카오
	public UserVO checkUserEmailAndPw(String email, String pw);//로그인검증
	public UserVO getInfo(String email);//정보얻기
	public int update(UserVO vo);//업데이트처리
	public int idCheck(UserVO vo);//중복체크
	public int pwCheck(UserVO vo);
	public int delete(String email);
	public int updatePw(UserVO vo)throws Exception;//비밀번호수정
	public void sendEmail(UserVO vo,String div);//메일발송
	public void findPw(UserVO vo,HttpServletResponse response)throws Exception ;
	public int permissionChange(int pno);
	
}
