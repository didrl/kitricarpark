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
	public int MemberParkingModify(int parkingId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ParkingDetailDto> MemberParkingList(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void MemberParkingDelete(int parkingId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CitiesDto> ParkSearch(String address) {
		return MemberParkingDaoImpl.getMemberParkingDao().ParkSearch(address);
	}

}
