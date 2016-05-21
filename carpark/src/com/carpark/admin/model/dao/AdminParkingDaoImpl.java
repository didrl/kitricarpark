package com.carpark.admin.model.dao;

public class AdminParkingDaoImpl implements AdminParkingDao {

	private static AdminParkingDao adminParkingDao;
	
	static {
		adminParkingDao = new AdminParkingDaoImpl();
	}
	
	private AdminParkingDaoImpl(){}

	public static AdminParkingDao getAdminParkingDao() {
		return adminParkingDao;
	}
	
	
}
