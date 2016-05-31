package com.carpark.member.model.service;

import java.util.List;

import com.carpark.admin.model.ParkingDetailDto;
import com.carpark.common.model.CitiesDto;

public interface MemberParkingService {
	
	void MemberParkingRegister(ParkingDetailDto parkingDto);
	int MemberParkingModify(int parkingId);
	List<ParkingDetailDto> MemberParkingList(String userId);
	void MemberParkingDelete(int parkingId);
	List<CitiesDto> ParkSearch(String address);
	
}
