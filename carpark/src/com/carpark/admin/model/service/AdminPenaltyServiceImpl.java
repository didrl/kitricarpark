package com.carpark.admin.model.service;

public class AdminPenaltyServiceImpl implements AdminPenaltyService {

	private static AdminPenaltyService adminPenaltyService;
	
	static {
		adminPenaltyService = new AdminPenaltyServiceImpl();
	}
	
	private AdminPenaltyServiceImpl(){}

	public static AdminPenaltyService getAdminPenaltyService() {
		return adminPenaltyService;
	}
	
}
