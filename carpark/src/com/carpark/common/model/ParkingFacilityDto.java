package com.carpark.common.model;

import java.io.Serializable;

public class ParkingFacilityDto extends ParkingDto implements Serializable{
	private int park_id;
	private String facility;
	private String feature;
	private String img_file_name;
	private String img_file_path;
	private String img_file_num;

	public int getPark_id() {
		return park_id;
	}
	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}
	public String getFacility() {
		return facility;
	}
	public void setFacility(String facility) {
		this.facility = facility;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getImg_file_name() {
		return img_file_name;
	}
	public void setImg_file_name(String img_file_name) {
		this.img_file_name = img_file_name;
	}
	public String getImg_file_path() {
		return img_file_path;
	}
	public void setImg_file_path(String img_file_path) {
		this.img_file_path = img_file_path;
	}
	public String getImg_file_num() {
		return img_file_num;
	}
	public void setImg_file_num(String img_file_num) {
		this.img_file_num = img_file_num;
	}
}
