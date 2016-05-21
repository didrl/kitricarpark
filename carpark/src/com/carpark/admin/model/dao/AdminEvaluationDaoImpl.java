package com.carpark.admin.model.dao;

public class AdminEvaluationDaoImpl implements AdminEvaluationDao {

	private static AdminEvaluationDao adminEvaluationDao;
	
	static {
		adminEvaluationDao = new AdminEvaluationDaoImpl();
	}
	
	private AdminEvaluationDaoImpl(){}

	public static AdminEvaluationDao getAdminEvaluationDao() {
		return adminEvaluationDao;
	}
	
	
}
