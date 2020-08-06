package com.hee.heechart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hee.heechart.VO.TestVO;

import org.apache.ibatis.session.SqlSession;

@Repository
public class TestDAO {
      
      @Autowired
      private SqlSession SqlSession;
      
      public List<TestVO> getTestValue(TestVO testVO){
            return SqlSession.selectList("com.hee.heechart.getTestValue", testVO);
      }
      
      public void TestInsert(TestVO testVO) {
    	  SqlSession.insert("com.hee.heechart.TestInsert", testVO);
      }
      
      
}

