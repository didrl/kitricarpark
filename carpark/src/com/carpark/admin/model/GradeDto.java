package com.carpark.admin.model;

public class GradeDto {
	
	private int gradeId;//등급번호
	private String gradeName;//등급이름
	private int avgPoint;//평점
	private int benefit;//혜택
	private int penalty;//패널티
	
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public int getAvgPoint() {
		return avgPoint;
	}
	public void setAvgPoint(int avgPoint) {
		this.avgPoint = avgPoint;
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
