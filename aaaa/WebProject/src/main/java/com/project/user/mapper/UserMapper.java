package com.project.user.mapper;

import com.project.user.VO.UserVO;

public interface UserMapper {
	public int join(UserVO vo);
	public int kakaoJoin(UserVO vo);
	public int login(UserVO vo);
	public UserVO getInfo(String email);
	
	public int imgUpload(String path);
	
	public int idCheck(String email);
}
