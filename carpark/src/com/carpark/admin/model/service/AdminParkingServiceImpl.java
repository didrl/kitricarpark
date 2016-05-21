package com.carpark.admin.model.service;

public class AdminParkingServiceImpl implements AdminParkingService {

	private static AdminParkingService adminParkingService;
	
	static {
		adminParkingService = new AdminParkingServiceImpl();
	}
	
	private AdminParkingServiceImpl(){}

	public static AdminParkingService getAdminParkingService() {
		return adminParkingService;
	}
}
