package com.project.user.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.user.VO.UserVO;

@Repository
public class UserDAO {
	
	
	@Autowired
	private SqlSession sqlsession;
	
	public int join(UserVO vo) {
		//매퍼의 네임스페이스
		System.out.println(vo.getEmail());
		System.out.println(vo.getAddress1());
		System.out.println(vo.getAddress2());
		return sqlsession.insert("com.project.user.mapper.join",vo);
	}
	
	public int login(UserVO vo) {
		return sqlsession.selectOne("com.project.user.mapper.login",vo);
	}
	
	public UserVO getInfo(String email) {
		return sqlsession.selectOne("com.project.user.mapper.getInfo",email);
	}
	
	public int imgUpload(String path) {
		return sqlsession.insert("com.project.user.mapper.imgUpload",path);
	}
	
	public int idCheck(UserVO vo) {
		return sqlsession.selectOne("com.project.user.mapper.idCheck",vo);
	}
	
	
	public int updatePw(UserVO vo) throws Exception {
		return sqlsession.update("com.project.user.mapper.updatePw", vo);
	}

}
