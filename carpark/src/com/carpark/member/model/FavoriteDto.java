package com.carpark.member.model;

import com.carpark.common.model.ParkingDto;

public class FavoriteDto extends ParkingDto {
	private int park_id;
	private String user_id;
	
	public int getPark_id() {
		return park_id;
	}
	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
