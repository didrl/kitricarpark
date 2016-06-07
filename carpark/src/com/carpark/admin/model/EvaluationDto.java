package com.carpark.admin.model;

public class EvaluationDto {
	
	private int penalty_code;
	private String penalty_name;
	private String penalty_content;
	private int penalty_point;
	
	public int getPenalty_code() {
		return penalty_code;
	}
	public void setPenalty_code(int penalty_code) {
		this.penalty_code = penalty_code;
	}
	public String getPenalty_name() {
		return penalty_name;
	}
	public void setPenalty_name(String penalty_name) {
		this.penalty_name = penalty_name;
	}
	public String getPenalty_content() {
		return penalty_content;
	}
	public void setPenalty_content(String penalty_content) {
		this.penalty_content = penalty_content;
	}
	public int getPenalty_point() {
		return penalty_point;
	}
	public void setPenalty_point(int penalty_point) {
		this.penalty_point = penalty_point;
	}
	
	
}
