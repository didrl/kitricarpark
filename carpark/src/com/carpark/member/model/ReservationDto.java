package com.carpark.member.model;

import java.util.ArrayList;
import java.util.Map;

public class ReservationDto {
	private String fromdate;
	private String todate;
	private int fromtime;
	private int totime;
	private String user_id;
	private int park_id;
	private String host_id;
	private String park_name;
	private int emd_code;
	private ArrayList<Map<String,String>> carinfo;
	
	

	public ArrayList<Map<String, String>> getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(ArrayList<Map<String, String>> carinfo) {
		this.carinfo = carinfo;
	}
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public int getFromtime() {
		return fromtime;
	}
	public void setFromtime(int fromtime) {
		this.fromtime = fromtime;
	}
	public int getTotime() {
		return totime;
	}
	public void setTotime(int totime) {
		this.totime = totime;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPark_id() {
		return park_id;
	}
	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getPark_name() {
		return park_name;
	}
	public void setPark_name(String park_name) {
		this.park_name = park_name;
	}
	public int getEmd_code() {
		return emd_code;
	}
	public void setEmd_code(int emd_code) {
		this.emd_code = emd_code;
	}
}
