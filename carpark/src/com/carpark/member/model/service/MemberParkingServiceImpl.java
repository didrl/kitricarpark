package com.carpark.member.model.service;

import java.util.List;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.common.model.ZipDto;
import com.carpark.member.model.dao.MemberParkingDaoImpl;

public class MemberParkingServiceImpl implements MemberParkingService {
	
	private static MemberParkingService memberParkingservice;
	
	static {
		memberParkingservice = new MemberParkingServiceImpl();
	}
	
	private MemberParkingServiceImpl(){}

	public static MemberParkingService getMemberParkingservice() {
		return memberParkingservice;
	}

	@Override
	public void parkingRegister(ParkingDetailDto parkingDto) {
		MemberParkingDaoImpl.getMemberParkingDao().parkingRegister(parkingDto);
	}

	@Override
	public void parkingModify(ParkingDetailDto parkingDto) {
		MemberParkingDaoImpl.getMemberParkingDao().parkingModify(parkingDto);
	}

	@Override
	public List<ParkingDetailDto> parkingList(String userId) {
		return MemberParkingDaoImpl.getMemberParkingDao().parkingList(userId);
	}

	@Override
	public int parkingDelete(int parkId) {
		return MemberParkingDaoImpl.getMemberParkingDao().parkingDelete(parkId);
	}

	@Override
	public List<ZipDto> parkingSearch(String address) {
		return MemberParkingDaoImpl.getMemberParkingDao().parkingSearch(address);
	}

	@Override
	public ParkingDetailDto parkingView(int parkId) {
		return MemberParkingDaoImpl.getMemberParkingDao().parkingView(parkId);
	}

}
