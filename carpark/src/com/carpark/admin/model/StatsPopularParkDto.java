package com.carpark.admin.model;

public class StatsPopularParkDto {
	private String park_name;
	private int rcount;
	private int fcount;
	private double park_avgpoint;
	public String getPark_name() {
		return park_name;
	}
	public void setPark_name(String park_name) {
		this.park_name = park_name;
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
	public double getPark_avgpoint() {
		return park_avgpoint;
	}
	public void setPark_avgpoint(double park_avgpoint) {
		this.park_avgpoint = park_avgpoint;
	}
	
	
	
}
