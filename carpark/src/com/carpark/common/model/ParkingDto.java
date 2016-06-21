package com.carpark.common.model;

import java.io.Serializable;

public class ParkingDto implements Serializable{
	private int park_id;		//주차장아이디
	private String park_name;	//주차장이름
	private int park_capacity;	//총주차면수
	private String owner_id;	//소유주아이디
	private double latitude;	//위도
	private double longitude;	//경도
	private String park_type;	//주차장종류
	private String content;		//상세내용
	private String detailAddr;	//상세주소
	private int park_public;	//공용/사설
	
	public int getPark_id() {
		return park_id;
	}
	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}
	public String getPark_name() {
		return park_name;
	}
	public void setPark_name(String park_name) {
		this.park_name = park_name;
	}
	public int getPark_capacity() {
		return park_capacity;
	}
	public void setPark_capacity(int park_capacity) {
		this.park_capacity = park_capacity;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getPark_type() {
		return park_type;
	}
	public void setPark_type(String park_type) {
		this.park_type = park_type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public int getPark_public() {
		return park_public;
	}
	public void setPark_public(int park_public) {
		this.park_public = park_public;
	}
}
