package com.carpark.member.model.service;

public class MemberReservationServiceImpl implements MemberReservationService {

	private static MemberReservationService memberReservationService;
	
	static {
		memberReservationService = new MemberReservationServiceImpl();
	}
	
	private MemberReservationServiceImpl(){}

	public static MemberReservationService getMemberReservationService() {
		return memberReservationService;
	}
	
	
}
