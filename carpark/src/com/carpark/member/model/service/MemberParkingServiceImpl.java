package com.carpark.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.common.model.ZipDto;
import com.carpark.member.model.dao.MemberParkingDaoImpl;
import com.carpark.util.BoardConstance;

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
	public List<ZipDto> parkingSearch(String address, int pg) {
		Map<String, String> map = new HashMap<String, String>();
		
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		System.out.println(end);
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		System.out.println(start);
		
		map.put("address", address);
		map.put("end", end + "");
		map.put("start", start + "");
		return MemberParkingDaoImpl.getMemberParkingDao().parkingSearch(map);
	}

	@Override
	public ParkingDetailDto parkingView(int parkId) {
		return MemberParkingDaoImpl.getMemberParkingDao().parkingView(parkId);
	}

}
