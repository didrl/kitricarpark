package com.carpark.admin.model;

public class GradeDto {
	private int grade_id;
	private String grade_name;
	private int avgpoint;
	private int benefit;
	private int penalty;
	
	public int getGrade_id() {
		return grade_id;
	}
	public void setGrade_id(int grade_id) {
		this.grade_id = grade_id;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public int getAvgpoint() {
		return avgpoint;
	}
	public void setAvgpoint(int avgpoint) {
		this.avgpoint = avgpoint;
	}
	public int getBenefit() {
		return benefit;
	}
	public void setBenefit(int benefit) {
		this.benefit = benefit;
	}
	public int getPenalty() {
		return penalty;
	}
	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}
	
}
