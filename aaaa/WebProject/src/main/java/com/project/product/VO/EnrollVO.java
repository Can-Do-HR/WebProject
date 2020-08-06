package com.project.product.VO;

public class EnrollVO {
	
	private int pno;
	private String email;
	
	
	public EnrollVO() {
		super();
	}
	public EnrollVO(int pno, String email) {
		super();
		this.pno = pno;
		this.email = email;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	

}
