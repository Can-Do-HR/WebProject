package com.project.user.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.user.VO.UserVO;

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
	public int login(UserVO vo) {
		//return userDAO.login(vo);
		return sqlsession.selectOne("com.project.user.mapper.login",vo);
	}
	
	@Override
	public UserVO getInfo(String email) {
		//return userDAO.getInfo(email);
		return sqlsession.selectOne("com.project.user.mapper.getInfo",email);
	}
	
	
	

	
	
	
	
	
	@Override
	public int imgUpload(String path) {
		//return userDAO.imgUpload(path);
		return sqlsession.insert("com.project.user.mapper.imgUpload",path);
	}

	@Override
	public int idCheck(String email) {
		//return userDAO.idCheck(vo);
		return sqlsession.selectOne("com.project.user.mapper.idCheck",email);
	}



	

	

	
	
}
