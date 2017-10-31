package com.ktds.service.vo;

import java.sql.Timestamp;

public class ServiceNoticeEventVO {

	private int noticeEventId;
	private String noticeEventFlag;
	private String subject;
	private String content;
	private Timestamp writeDate;

	public int getNoticeEventId() {
		return noticeEventId;
	}

	public void setNoticeEventId(int noticeEventId) {
		this.noticeEventId = noticeEventId;
	}

	public String getNoticeEventFlag() {
		return noticeEventFlag;
	}

	public void setNoticeEventFlag(String noticeEventFlag) {
		this.noticeEventFlag = noticeEventFlag;
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

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

}
