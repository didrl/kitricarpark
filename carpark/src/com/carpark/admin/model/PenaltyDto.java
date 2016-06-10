package com.carpark.admin.model;

public class PenaltyDto extends EvaluationDto {

	private int penalty_num;
	private String user_id;
	private int penalty_code;
	private String penalty_date;
	private String penalty_memo;
	private int seq;
	
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
	public int getPenalty_code() {
		return penalty_code;
	}
	public void setPenalty_code(int penalty_code) {
		this.penalty_code = penalty_code;
	}
	public String getPenalty_date() {
		return penalty_date;
	}
	public void setPenalty_date(String penalty_date) {
		this.penalty_date = penalty_date;
	}
	public String getPenalty_memo() {
		return penalty_memo;
	}
	public void setPenalty_memo(String penalty_memo) {
		this.penalty_memo = penalty_memo;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	

}
