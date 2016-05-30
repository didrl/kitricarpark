package com.carpark.member.model.service;

import java.util.List;

import com.carpark.common.model.CitiesDto;
import com.carpark.common.model.ParkingDetailDto;
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
	public void MemberParkingRegister(ParkingDetailDto parkingDto) {
		MemberParkingDaoImpl.getMemberParkingDao().MemberParkingRegister(parkingDto);
	}

	@Override
	public void MemberParkingModify(ParkingDetailDto parkingDto) {
		MemberParkingDaoImpl.getMemberParkingDao().MemberParkingModify(parkingDto);
	}

	@Override
	public List<ParkingDetailDto> MemberParkingList(String userId) {
		return MemberParkingDaoImpl.getMemberParkingDao().MemberParkingList(userId);
	}

	@Override
	public void MemberParkingDelete(int parkId) {
		MemberParkingDaoImpl.getMemberParkingDao().MemberParkingDelete(parkId);
	}

	@Override
	public List<CitiesDto> ParkSearch(String address) {
		return MemberParkingDaoImpl.getMemberParkingDao().ParkSearch(address);
	}

}
