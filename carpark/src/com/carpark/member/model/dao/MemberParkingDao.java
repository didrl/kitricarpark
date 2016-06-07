package com.carpark.member.model.dao;

import java.util.List;
import java.util.Map;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.common.model.ZipDto;

public interface MemberParkingDao {
	
	void parkingRegister(ParkingDetailDto parkingDto);
	void parkingModify(ParkingDetailDto parkingDto);
	List<ParkingDetailDto> parkingList(String userId);
	int parkingDelete(int parkId);
	List<ZipDto> parkingSearch(Map<String, String> map);
	ParkingDetailDto parkingView(int parkId);

}
