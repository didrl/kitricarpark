package com.carpark.member.model.dao;

public class MemberReservationDaoImpl implements MemberReservationDao {
	
	private static MemberReservationDao memberReservationDao;
	
	static {
		memberReservationDao = new MemberReservationDaoImpl();
	}
	
	private MemberReservationDaoImpl(){}

	public static MemberReservationDao getMemberReservationDao() {
		return memberReservationDao;
	}
	
	
}
