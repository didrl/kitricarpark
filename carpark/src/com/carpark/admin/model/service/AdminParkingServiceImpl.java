package com.carpark.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carpark.admin.model.dao.AdminParkingDaoImpl;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.ReservationDto;
import com.carpark.util.BoardConstance;

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
	public List<ParkingDetailDto> parkingList(int pg, String key, String word, String visit) {
		Map<String, String> map = new HashMap<String, String>();
		
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		
		map.put("end", end + "");
		map.put("start", start + "");
		map.put("key", key);
		map.put("word", word);
		map.put("visit", visit);
		return AdminParkingDaoImpl.getAdminParkingDao().parkingList(map);
	}

	@Override
	public void parkingRegister(ParkingDetailDto parkingDetailDto) {
		AdminParkingDaoImpl.getAdminParkingDao().parkingRegister(parkingDetailDto);
		
	}

	@Override
	public void adminParkingVisit(String parkId) {
		AdminParkingDaoImpl.getAdminParkingDao().adminParkingVisit(parkId);
		
	}


}
