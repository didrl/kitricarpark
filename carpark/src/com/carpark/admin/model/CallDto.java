package com.carpark.admin.model;

import com.carpark.member.model.BoardDto;

public class CallDto extends BoardDto{
	private int pCall_Id;
	private int pCseq;
	private String pCall_ADDR;
	private String pCall_Img;
	private int pCall_Flag;
	private int pCall_Num;
	private int pCall_Ok;
	private int pCall_Latitude;
	private int pCall_Longitude;
	
	public int getpCall_Id() {
		return pCall_Id;
	}
	public void setpCall_Id(int pCall_Id) {
		this.pCall_Id = pCall_Id;
	}
	public int getpCseq() {
		return pCseq;
	}
	public void setpCseq(int pCseq) {
		this.pCseq = pCseq;
	}
	public String getpCall_ADDR() {
		return pCall_ADDR;
	}
	public void setpCall_ADDR(String pCall_ADDR) {
		this.pCall_ADDR = pCall_ADDR;
	}
	public String getpCall_Img() {
		return pCall_Img;
	}
	public void setpCall_Img(String pCall_Img) {
		this.pCall_Img = pCall_Img;
	}
	public int getpCall_Flag() {
		return pCall_Flag;
	}
	public void setpCall_Flag(int pCall_Flag) {
		this.pCall_Flag = pCall_Flag;
	}
	public int getpCall_Num() {
		return pCall_Num;
	}
	public void setpCall_Num(int pCall_Num) {
		this.pCall_Num = pCall_Num;
	}
	public int getpCall_Ok() {
		return pCall_Ok;
	}
	public void setpCall_Ok(int pCall_Ok) {
		this.pCall_Ok = pCall_Ok;
	}
	public int getpCall_Latitude() {
		return pCall_Latitude;
	}
	public void setpCall_Latitude(int pCall_Latitude) {
		this.pCall_Latitude = pCall_Latitude;
	}
	public int getpCall_Longitude() {
		return pCall_Longitude;
	}
	public void setpCall_Longitude(int pCall_Longitude) {
		this.pCall_Longitude = pCall_Longitude;
	}

}
