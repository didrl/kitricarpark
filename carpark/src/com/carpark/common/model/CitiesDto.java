package com.carpark.common.model;

public class CitiesDto {

	private int ssgCode;
	private int emdCode;
	private String ssgName;
	private String emdName;
	private double lat;
	private double lng;
	
	public int getSsgCode() {
		return ssgCode;
	}
	public void setSsgCode(int ssgCode) {
		this.ssgCode = ssgCode;
	}
	public int getEmdCode() {
		return emdCode;
	}
	public void setEmdCode(int emdCode) {
		this.emdCode = emdCode;
	}
	public String getSsgName() {
		return ssgName;
	}
	public void setSsgName(String ssgName) {
		this.ssgName = ssgName;
	}
	public String getEmdName() {
		return emdName;
	}
	public void setEmdName(String emdName) {
		this.emdName = emdName;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}

}
