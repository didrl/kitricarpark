package com.carpark.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carpark.admin.model.dao.AdminParkingDaoImpl;
import com.carpark.common.model.ParkingDetailDto;
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

	@Override
	public List<ParkingDetailDto> parkingList(int park_public, int pg, String key, String word) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("park_public", park_public + "");
		map.put("pg", pg + "");
		map.put("key", key);
		map.put("word", word);
		return AdminParkingDaoImpl.getAdminParkingDao().parkingList(map);
	}

	@Override
	public void parkingRegister(ParkingDetailDto parkingDetailDto) {
		AdminParkingDaoImpl.getAdminParkingDao().parkingRegister(parkingDetailDto);
		
	}


}
