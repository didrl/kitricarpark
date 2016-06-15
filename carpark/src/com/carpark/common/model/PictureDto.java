package com.carpark.common.model;

public class PictureDto {
	//sequence name: pic_seq
	private int pic_seq;
	private String pic_name;
	private String pic_path;
	private String pic_savefolder;
	private int pic_count;
	
	public int getPic_seq() {
		return pic_seq;
	}
	public void setPic_seq(int pic_seq) {
		this.pic_seq = pic_seq;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	public String getPic_path() {
		return pic_path;
	}
	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	public String getPic_savefolder() {
		return pic_savefolder;
	}
	public void setPic_savefolder(String pic_savefolder) {
		this.pic_savefolder = pic_savefolder;
	}
	public int getPic_count() {
		return pic_count;
	}
	public void setPic_count(int pic_count) {
		this.pic_count = pic_count;
	}
}
