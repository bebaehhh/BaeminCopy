package com.ktds.service.vo;

public class ServiceFaqVO {

	private int faqId;
	private String faqMenu;
	private String subject;
	private String content;
	private String writeDate;
	
	
	public int getFaqId() {
		return faqId;
	}
	public void setFaqId(int faqId) {
		this.faqId = faqId;
	}
	public String getFaqMenu() {
		return faqMenu;
	}
	public void setFaqMenu(String faqMenu) {
		this.faqMenu = faqMenu;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
