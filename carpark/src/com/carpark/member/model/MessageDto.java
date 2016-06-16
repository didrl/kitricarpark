package com.carpark.member.model;

import java.io.Serializable;

public class MessageDto extends BoardDto implements Serializable{

	private int mseq;
	private int seq;
	private int bcode;
	private String receiverId;
	private int msgFlag;
	private int delete_send;
	private int delete_recei;

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
	public int getDelete_send() {
		return delete_send;
	}
	public void setDelete_send(int delete_send) {
		this.delete_send = delete_send;
	}
	public int getDelete_recei() {
		return delete_recei;
	}
	public void setDelete_recei(int delete_recei) {
		this.delete_recei = delete_recei;
	}

		
}
