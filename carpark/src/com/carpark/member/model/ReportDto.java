package com.carpark.member.model;

public class ReportDto extends BoardDto {
	
	private int cseq;
	private int park_id;
	private String report_id;
	private int report_flag;
	
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public int getPark_id() {
		return park_id;
	}
	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	public int getReport_flag() {
		return report_flag;
	}
	public void setReport_flag(int report_flag) {
		this.report_flag = report_flag;
	}
	

}
