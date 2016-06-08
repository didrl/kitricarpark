package com.carpark.admin.model;

public class StatsGoodUseUserDto {
	private String user_id;
	private int rcount;
	private int fcount;
	private double user_avgpoint;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public int getFcount() {
		return fcount;
	}
	public void setFcount(int fcount) {
		this.fcount = fcount;
	}
	public double getUser_avgpoint() {
		return user_avgpoint;
	}
	public void setUser_avgpoint(double user_avgpoint) {
		this.user_avgpoint = user_avgpoint;
	}
	
	
}
