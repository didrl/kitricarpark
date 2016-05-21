package com.carpark.admin.model.service;

public class AdminEvaluationServiceImpl implements AdminEvaluationService {

	private static AdminEvaluationService adminEvaluationService;
	
	static {
		adminEvaluationService = new AdminEvaluationServiceImpl();
	}
	
	private AdminEvaluationServiceImpl(){}

	public static AdminEvaluationService getAdminEvaluationService() {
		return adminEvaluationService;
	}
	
}
