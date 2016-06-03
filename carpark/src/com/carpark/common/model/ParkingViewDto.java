package com.carpark.common.model;

public class ParkingViewDto {
	private String park_name;
	private String owner_id;
	private String location;
	private int park_flag;
	private int fulltime_monthly_pay;
	private double avg_point;
	
	public String getPark_name() {
		return park_name;
	}
	public void setPark_name(String park_name) {
		this.park_name = park_name;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getPark_flag() {
		return park_flag;
	}
	public void setPark_flag(int park_flag) {
		this.park_flag = park_flag;
	}
	public int getFulltime_monthly_pay() {
		return fulltime_monthly_pay;
	}
	public void setFulltime_monthly_pay(int fulltime_monthly_pay) {
		this.fulltime_monthly_pay = fulltime_monthly_pay;
	}
	public double getAvg_point() {
		return avg_point;
	}
	public void setAvg_point(double avg_point) {
		this.avg_point = avg_point;
	}
}
