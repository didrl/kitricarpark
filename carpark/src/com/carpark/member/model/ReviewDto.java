package com.carpark.member.model;

public class ReviewDto {
	private String content;
	private String subject;
	private String user_id;
	private int park_id;
	private double avgPoint;
	private String logtime;
	
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
