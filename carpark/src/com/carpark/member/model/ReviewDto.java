package com.carpark.member.model;

import java.io.Serializable;

public class ReviewDto implements Serializable{
	private String content;
	private String subject;
	private String user_id;
	private String avaled_id;
	private int park_id;
	private double avgPoint;
	private String logtime;
	private int host_flag;
	private int seq; 
	private int bcode;
	private int rseq;
	
	
	public String getAvaled_id() {
		return avaled_id;
	}
	public void setAvaled_id(String avaled_id) {
		this.avaled_id = avaled_id;
	}
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getHost_flag() {
		return host_flag;
	}
	public void setHost_flag(int host_flag) {
		this.host_flag = host_flag;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPark_id() {
		return park_id;
	}
	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}
	public double getAvgPoint() {
		return avgPoint;
	}
	public void setAvgPoint(double avgPoint) {
		this.avgPoint = avgPoint;
	}
	
	
}
