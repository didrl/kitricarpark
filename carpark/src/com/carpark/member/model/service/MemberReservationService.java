package com.carpark.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.carpark.member.model.ReservationDto;

public interface MemberReservationService {
	ReservationDto getCarInfo(String user_id);
	ArrayList<Map<String,String>> getAvailDate();
}
