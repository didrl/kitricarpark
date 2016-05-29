package com.carpark.common.model;

public class ParkingDto {
	private int parkId;
	private String parkName;
	private int parkCapacity;
	private String ownerId;
	private int latitude;
	private int longtitude;
	private String parkType;
	private String content;
	
	public int getParkId() {
		return parkId;
	}
	public void setParkId(int parkId) {
		this.parkId = parkId;
	}
	public String getParkName() {
		return parkName;
	}
	public void setParkName(String parkName) {
		this.parkName = parkName;
	}
	public int getParkCapacity() {
		return parkCapacity;
	}
	public void setParkCapacity(int parkCapacity) {
		this.parkCapacity = parkCapacity;
	}
	public String getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	public int getLatitude() {
		return latitude;
	}
	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}
	public int getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(int longtitude) {
		this.longtitude = longtitude;
	}
	public String getParkType() {
		return parkType;
	}
	public void setParkType(String parkType) {
		this.parkType = parkType;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
