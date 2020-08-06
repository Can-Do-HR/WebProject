package com.project.creator.VO;

import org.springframework.web.multipart.MultipartFile;

public class EnrollBoardContentVO {
	
//	private int pno;
//	private MultipartFile contentImg;
//	private String contentText;
//	
//	public EnrollBoardContentVO() {}
//	
//	public EnrollBoardContentVO(int pno, MultipartFile contentImg, String contentText) {
//		this.pno = pno;
//		this.contentImg = contentImg;
//		this.contentText = contentText;
//	}
//	public int getPno() {
//		return pno;
//	}
//	public void setPno(int pno) {
//		this.pno = pno;
//	}
//	public MultipartFile getContentImg() {
//		return contentImg;
//	}
//	public void setContentImg(MultipartFile contentImg) {
//		this.contentImg = contentImg;
//	}
//	public String getContentText() {
//		return contentText;
//	}
//	public void setContentText(String contentText) {
//		this.contentText = contentText;
//	}
	
	
	
	
	private int pno;
	private String contentImgImg;
	private String contentText;
	
	public EnrollBoardContentVO() {}
	
	public EnrollBoardContentVO(int pno, String contentImg, String contentText) {
		this.pno = pno;
		this.contentImgImg = contentImg;
		this.contentText = contentText;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getContentImgImg() {
		return contentImgImg;
	}
	public void setContentImgImg(String contentImg) {
		this.contentImgImg = contentImg;
	}
	public String getContentText() {
		return contentText;
	}
	public void setContentText(String contentText) {
		this.contentText = contentText;
	}
	
	
	
}
