package com.carpark.common.model;

public class ParkingDetailDto extends ParkingFacilityDto{
	private int park_id;						//주차장 아이디
	private int park_flag;					// 주차장 사용가능 여부
	private double park_avgPoint; 		//주차장 평점
	private int get_status;					//실시간 정보제공 여부
	private int cur_parking;					//현재 주차중인 차량 수
	private int fulltime_monthly_pay;	//월 정기권 금액
	private int park_rate;					//기본 주차요금
	private int park_time_rate;			//기본 주차시간
	private int add_park_rate;				//추가단위 요금
	private int day_max_pay;				//하루 최대 요금
	private String pay_yn;					//평일 유무료 구분
	private String satur_pay_yn;			//토요일 유무료 구분
	private String holi_pay_yn;				//공휴일 유무료 구분
	private int emd_code;
	
	public int getEmd_code() {
		return emd_code;
	}
	public void setEmd_code(int emd_code) {
		this.emd_code = emd_code;
	}
	public int getPark_id() {
		return park_id;
	}
	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}
	public int getPark_flag() {
		return park_flag;
	}
	public void setPark_flag(int park_flag) {
		this.park_flag = park_flag;
	}
	public double getPark_avgPoint() {
		return park_avgPoint;
	}
	public void setPark_avgPoint(double park_avgPoint) {
		this.park_avgPoint = park_avgPoint;
	}
	public int getGet_status() {
		return get_status;
	}
	public void setGet_status(int get_status) {
		this.get_status = get_status;
	}
	public int getCur_parking() {
		return cur_parking;
	}
	public void setCur_parking(int cur_parking) {
		this.cur_parking = cur_parking;
	}
	public int getFulltime_monthly_pay() {
		return fulltime_monthly_pay;
	}
	public void setFulltime_monthly_pay(int fulltime_monthly_pay) {
		this.fulltime_monthly_pay = fulltime_monthly_pay;
	}
	public int getPark_rate() {
		return park_rate;
	}
	public void setPark_rate(int park_rate) {
		this.park_rate = park_rate;
	}
	public int getPark_time_rate() {
		return park_time_rate;
	}
	public void setPark_time_rate(int park_time_rate) {
		this.park_time_rate = park_time_rate;
	}
	public int getAdd_park_rate() {
		return add_park_rate;
	}
	public void setAdd_park_rate(int add_park_rate) {
		this.add_park_rate = add_park_rate;
	}
	public int getDay_max_pay() {
		return day_max_pay;
	}
	public void setDay_max_pay(int day_max_pay) {
		this.day_max_pay = day_max_pay;
	}
	public String getPay_yn() {
		return pay_yn;
	}
	public void setPay_yn(String pay_yn) {
		this.pay_yn = pay_yn;
	}
	public String getSatur_pay_yn() {
		return satur_pay_yn;
	}
	public void setSatur_pay_yn(String satur_pay_yn) {
		this.satur_pay_yn = satur_pay_yn;
	}
	public String getHoli_pay_yn() {
		return holi_pay_yn;
	}
	public void setHoli_pay_yn(String holi_pay_yn) {
		this.holi_pay_yn = holi_pay_yn;
	}
}
