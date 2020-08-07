package com.project.user.mapper;



import javax.servlet.http.HttpServletResponse;

import com.project.user.VO.UserVO;

public interface UserMapper {
	public int join(UserVO vo);
	public int kakaoJoin(UserVO vo);
	public int login(UserVO vo);
	public UserVO getInfo(String email);
	public int imgUpload(String path);
	public int idCheck(UserVO vo);
	public int pwCheck(UserVO vo);
	public int delete(UserVO vo);
	public int updatePw(UserVO vo);
	public void sendEmail(UserVO vo,String div);
	public void findPw(UserVO vo,HttpServletResponse response)throws Exception;
}
