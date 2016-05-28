package com.carpark.admin.model;

public class ParkingDto {
	private int park_id;
	private String park_name;
	private String location;
	private int park_capacity;
	private String owner_id;
	private double latitude;
	private double longitude;
	private String park_type;
	private String content;
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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
	
	
}
