package com.exam.myapp.reply;

import javax.xml.crypto.Data;

public class ReplyVo {
	private int repNo;
	private String repContent;
	private String repWriter;
	private Data repRegDate;
	private int repBbsNo;
	
	public int getRepNo() {
		return repNo;
	}
	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public String getRepWriter() {
		return repWriter;
	}
	public void setRepWriter(String repWriter) {
		this.repWriter = repWriter;
	}
	public Data getRepRegDate() {
		return repRegDate;
	}
	public void setRepRegDate(Data repRegDate) {
		this.repRegDate = repRegDate;
	}
	public int getRepBbsNo() {
		return repBbsNo;
	}
	public void setRepBbsNo(int repBbsNo) {
		this.repBbsNo = repBbsNo;
	}
}
