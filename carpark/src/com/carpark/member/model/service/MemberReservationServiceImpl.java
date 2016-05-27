package com.carpark.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.ReservationDto;
import com.carpark.member.model.dao.MemberReservationDaoImpl;

public class MemberReservationServiceImpl implements MemberReservationService {

	private static MemberReservationService memberReservationService;
	
	static {
		memberReservationService = new MemberReservationServiceImpl();
	}
	
	private MemberReservationServiceImpl(){}

	public static MemberReservationService getMemberReservationService() {
		return memberReservationService;
	}

	@Override
	public ArrayList<MemberCarDto> getCarInfo(String user_id) {
		return MemberReservationDaoImpl.getMemberReservationDao().getCarInfo(user_id);
	}

	@Override
	public ArrayList<Map<String,String>> getAvailDate(int park_id) {
		return MemberReservationDaoImpl.getMemberReservationDao().getUsingDate(park_id);
	}

	@Override
	public void registerReservation(ReservationDto reservationDto) {
		MemberReservationDaoImpl.getMemberReservationDao().registerReservation(reservationDto);
	}
	
	
}
