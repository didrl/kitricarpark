package com.carpark.admin.model;

public class StatsGoodBehaviorUsersDto {
	private String user_id;
	private double user_avgpoint;
	private int penalty;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public double getUser_avgpoint() {
		return user_avgpoint;
	}
	public void setUser_avgpoint(double user_avgpoint) {
		this.user_avgpoint = user_avgpoint;
	}
	public int getPenalty() {
		return penalty;
	}
	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}
	
	
}
