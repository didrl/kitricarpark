package com.carpark.common.model;

public class ParkingDetailDto extends ParkingFacilityDto {
	
	private int parkFlag;
	private int parkAvgPoint;
	private int getStatus;
	private int curParking;
	private String payYn;
	private String saturPayYn;
	private String holiPayYn;
	private int fullTimeMonthlyPay;
	private int parkRate;
	private int parkTimeRate;
	private int addParkRate;
	private int dayMaxPay;
	
	public int getParkFlag() {
		return parkFlag;
	}
	public void setParkFlag(int parkFlag) {
		this.parkFlag = parkFlag;
	}
	public int getParkAvgPoint() {
		return parkAvgPoint;
	}
	public void setParkAvgPoint(int parkAvgPoint) {
		this.parkAvgPoint = parkAvgPoint;
	}
	public int getGetStatus() {
		return getStatus;
	}
	public void setGetStatus(int getStatus) {
		this.getStatus = getStatus;
	}
	public int getCurParking() {
		return curParking;
	}
	public void setCurParking(int curParking) {
		this.curParking = curParking;
	}
	public String getPayYn() {
		return payYn;
	}
	public void setPayYn(String payYn) {
		this.payYn = payYn;
	}
	public String getSaturPayYn() {
		return saturPayYn;
	}
	public void setSaturPayYn(String saturPayYn) {
		this.saturPayYn = saturPayYn;
	}
	public String getHoliPayYn() {
		return holiPayYn;
	}
	public void setHoliPayYn(String holiPayYn) {
		this.holiPayYn = holiPayYn;
	}
	public int getFullTimeMonthlyPay() {
		return fullTimeMonthlyPay;
	}
	public void setFullTimeMonthlyPay(int fullTimeMonthlyPay) {
		this.fullTimeMonthlyPay = fullTimeMonthlyPay;
	}
	public int getParkRate() {
		return parkRate;
	}
	public void setParkRate(int parkRate) {
		this.parkRate = parkRate;
	}
	public int getParkTimeRate() {
		return parkTimeRate;
	}
	public void setParkTimeRate(int parkTimeRate) {
		this.parkTimeRate = parkTimeRate;
	}
	public int getAddParkRate() {
		return addParkRate;
	}
	public void setAddParkRate(int addParkRate) {
		this.addParkRate = addParkRate;
	}
	public int getDayMaxPay() {
		return dayMaxPay;
	}
	public void setDayMaxPay(int dayMaxPay) {
		this.dayMaxPay = dayMaxPay;
	}
	
	
}
