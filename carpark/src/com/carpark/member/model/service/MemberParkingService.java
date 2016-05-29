package com.carpark.member.model.service;

import java.util.List;

import com.carpark.common.model.CitiesDto;
import com.carpark.common.model.ParkingDetailDto;

public interface MemberParkingService {
	
	void MemberParkingRegister(ParkingDetailDto parkingDto);
	int MemberParkingModify(int parkingId);
	List<ParkingDetailDto> MemberParkingList(String userId);
	void MemberParkingDelete(int parkingId);
	List<CitiesDto> ParkSearch(String address);
	
}
