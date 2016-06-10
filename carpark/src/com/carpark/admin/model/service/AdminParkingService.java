package com.carpark.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.ReservationDto;

public interface AdminParkingService {
	int registerReservation(ParkingDetailDto parkingDetailDto);
	ArrayList<ReservationDto> myReservationList(String user_id); 
	List<ParkingDetailDto> parkingList(int pg, String key, String word, String auth);
	void parkingRegister(ParkingDetailDto parkingDetailDto);
	void adminParkingAuth(String parkId);
}
