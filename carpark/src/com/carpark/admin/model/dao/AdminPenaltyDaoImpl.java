package com.carpark.admin.model.dao;

public class AdminPenaltyDaoImpl implements AdminPenaltyDao {

	private static AdminPenaltyDao adminPenaltyDao;
	
	static {
		adminPenaltyDao = new AdminPenaltyDaoImpl();
	}
	
	private AdminPenaltyDaoImpl(){}

	public static AdminPenaltyDao getAdminPenaltyDao() {
		return adminPenaltyDao;
	}
	
	
}
