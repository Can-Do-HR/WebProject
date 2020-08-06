package com.hee.heechart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hee.heechart.VO.TestVO;

@Service("TestService")
public class TestServiceImpl implements TestService {
    
    @Autowired
    TestDAO TestDAO;
    
    @Override
    public List<TestVO> getTestValue(TestVO testVO){
          return TestDAO.getTestValue(testVO);
    }

	@Override
	public void TestInsert(TestVO testVO) {
		TestDAO.TestInsert(testVO);
		
	}
}

