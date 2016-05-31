package com.carpark.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.ReservationDto;

public interface MemberReservationService {
	ArrayList<MemberCarDto> getCarInfo(String user_id);
	ArrayList<ReservationDto> myReservationList(String user_id);
	ArrayList<Map<String, String>> getAvailDate(int park_id);
	void registerReservation(ReservationDto reservationDto);
}
