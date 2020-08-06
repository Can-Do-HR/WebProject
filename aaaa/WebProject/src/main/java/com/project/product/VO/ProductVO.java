package com.project.product.VO;

import java.sql.Timestamp;
import java.util.ArrayList;

import lombok.Data;


public class ProductVO {

	private int pno;
	private String title;
	private String category;
	private String creator;
	private String thumbnail;
	private String intro;
	private Timestamp startDate;
	private Timestamp endDate;
	private String price;
	private String volume;
	private Timestamp regdate;
	private String term;
	
	private ArrayList<ContentVO> contents;
	
	private ArrayList<QnAVO> QnA;
	
	
	
	
	
	

	public ProductVO() {
		super();
	}

	public ProductVO(int pno, String title, String category, String creator, String thumbnail, String intro,
			Timestamp startDate, Timestamp endDate, String price, String volume, Timestamp regdate, String term,
			ArrayList<ContentVO> contents, ArrayList<QnAVO> qnA) {
		super();
		this.pno = pno;
		this.title = title;
		this.category = category;
		this.creator = creator;
		this.thumbnail = thumbnail;
		this.intro = intro;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.volume = volume;
		this.regdate = regdate;
		this.term = term;
		this.contents = contents;
		QnA = qnA;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public ArrayList<ContentVO> getContents() {
		return contents;
	}

	public void setContents(ArrayList<ContentVO> contents) {
		this.contents = contents;
	}

	public ArrayList<QnAVO> getQnA() {
		return QnA;
	}

	public void setQnA(ArrayList<QnAVO> qnA) {
		QnA = qnA;
	}
	
	
	
	
	
	
	
}
