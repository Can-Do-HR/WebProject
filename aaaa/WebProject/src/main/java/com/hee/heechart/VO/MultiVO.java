package com.hee.heechart.VO;

import java.util.ArrayList;


public class MultiVO {
	private ArrayList<VO> list;

	
	public MultiVO() {}
	
	public MultiVO(ArrayList<VO> list) {
		super();
		this.list = list;
	}

	public ArrayList<VO> getList() {
		return list;
	}

	public void setList(ArrayList<VO> list) {
		this.list = list;
	}
	
	
	
}
