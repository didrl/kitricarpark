package com.carpark.admin.model.dao;

import java.util.ArrayList;

import com.carpark.admin.model.ParkingDetailDto;
import com.carpark.member.model.ReservationDto;

public interface AdminParkingDao {
	int registerReservation(ParkingDetailDto parkingDetailDto);
	ArrayList<ReservationDto> myReservationList(String user_id); 
}
