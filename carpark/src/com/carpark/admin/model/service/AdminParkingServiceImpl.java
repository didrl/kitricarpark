package com.carpark.admin.model.service;

import java.util.ArrayList;

import com.carpark.admin.model.ParkingDetailDto;
import com.carpark.admin.model.dao.AdminParkingDaoImpl;
import com.carpark.member.model.ReservationDto;

public class AdminParkingServiceImpl implements AdminParkingService {

	private static AdminParkingService adminParkingService;
	
	static {
		adminParkingService = new AdminParkingServiceImpl();
	}
	
	private AdminParkingServiceImpl(){}

	public static AdminParkingService getAdminParkingService() {
		return adminParkingService;
	}

	@Override
	public int registerReservation(ParkingDetailDto parkingDetailDto) {
		return AdminParkingDaoImpl.getAdminParkingDao().registerReservation(parkingDetailDto);
	}

	@Override
	public ArrayList<ReservationDto> myReservationList(String user_id) {
		return AdminParkingDaoImpl.getAdminParkingDao().myReservationList(user_id);
	}


}
