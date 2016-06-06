package com.carpark.member.model.dao;

import java.util.List;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.common.model.ZipDto;

public interface MemberParkingDao {
	
	void parkingRegister(ParkingDetailDto parkingDto);
	void parkingModify(ParkingDetailDto parkingDto);
	List<ParkingDetailDto> parkingList(String userId);
	int parkingDelete(int parkId);
	List<ZipDto> parkingSearch(String address);
	ParkingDetailDto parkingView(int parkId);

}
