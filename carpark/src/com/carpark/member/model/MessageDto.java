package com.carpark.member.model;

public class MessageDto extends BoardDto {

	private int mseq;
	private int seq;
	private int bcode;
	private String receiverId;
	private int msgFlag;
	
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public int getMsgFlag() {
		return msgFlag;
	}
	public void setMsgFlag(int msgFlag) {
		this.msgFlag = msgFlag;
	}
	
	
}
