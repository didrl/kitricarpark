package com.carpark.admin.model;

public class PenaltyDto extends EvaluationDto {

	private int penalty_num;
	private String user_id;
	private String penalty_date;
	private String penalty_content;
	
	public int getPenalty_num() {
		return penalty_num;
	}
	public void setPenalty_num(int penalty_num) {
		this.penalty_num = penalty_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPenalty_date() {
		return penalty_date;
	}
	public void setPenalty_date(String penalty_date) {
		this.penalty_date = penalty_date;
	}
	public String getPenalty_content() {
		return penalty_content;
	}
	public void setPenalty_content(String penalty_content) {
		this.penalty_content = penalty_content;
	}
	

	
}
