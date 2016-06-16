package com.carpark.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.ReservationDto;

public interface AdminParkingService {

	List<ParkingDetailDto> parkingList(int pg, String flag, String visit, String key, String word);
	void parkingRegister(ParkingDetailDto parkingDetailDto);
	void adminParkingVisit(String parkId);
}
