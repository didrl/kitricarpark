package com.carpark.admin.model.dao;

public class AdminGradeDaoImpl implements AdminGradeDao {

	private static AdminGradeDao adminGradeDao;
	
	static {
		adminGradeDao = new AdminGradeDaoImpl();
	}
	
	private AdminGradeDaoImpl(){}

	public static AdminGradeDao getAdminGradeDao() {
		return adminGradeDao;
	}
	
	
}
