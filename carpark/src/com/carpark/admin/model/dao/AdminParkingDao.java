package com.carpark.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.ReservationDto;

public interface AdminParkingDao {

	List<ParkingDetailDto> parkingList(Map<String, String> map);
	void parkingRegister(ParkingDetailDto parkingDetailDto);
	void adminParkingVisit(String parkId);
}
