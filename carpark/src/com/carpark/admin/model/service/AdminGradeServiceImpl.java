package com.carpark.admin.model.service;

public class AdminGradeServiceImpl implements AdminGradeService {

	private static AdminGradeService adminGradeService;
	
	static {
		adminGradeService = new AdminGradeServiceImpl();
	}
	
	private AdminGradeServiceImpl(){}

	public static AdminGradeService getAdminGradeService() {
		return adminGradeService;
	}
	
	
}
