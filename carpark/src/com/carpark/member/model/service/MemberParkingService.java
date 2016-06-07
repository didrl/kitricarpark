package com.carpark.member.model.service;

import java.util.List;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.common.model.ZipDto;

public interface MemberParkingService {
	
	void parkingRegister(ParkingDetailDto parkingDto);
	void parkingModify(ParkingDetailDto parkingDto);
	List<ParkingDetailDto> parkingList(String ownerId, int pg, String key, String word);
	int parkingDelete(int parkId);
	List<ZipDto> parkingSearch(String address, int pg);
	ParkingDetailDto parkingView(int parkId);
	
}
