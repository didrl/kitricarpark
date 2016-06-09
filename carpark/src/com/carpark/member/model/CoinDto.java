package com.carpark.member.model;

import com.carpark.member.model.MemberDto;

public class CoinDto extends MemberDto {
	int coin;
	String reser_id;
	int cflag;
	String cdate;
	int cid;
	String user_id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCoin() {
		return coin;
	}
	public void setCoin(int coin) {
		this.coin = coin;
	}
	public String getReser_id() {
		return reser_id;
	}
	public void setReser_id(String reser_id) {
		this.reser_id = reser_id;
	}
	public int getCflag() {
		return cflag;
	}
	public void setCflag(int cflag) {
		this.cflag = cflag;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
}
