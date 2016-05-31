package com.carpark.member.model.dao;

import java.util.List;

import com.carpark.admin.model.ParkingDetailDto;
import com.carpark.common.model.CitiesDto;

public interface MemberParkingDao {
	
	void MemberParkingRegister(ParkingDetailDto parkingDto);
	void MemberParkingModify(ParkingDetailDto parkingDto);
	List<ParkingDetailDto> MemberParkingList(String userId);
	void MemberParkingDelete(int parkId);
	List<CitiesDto> ParkSearch(String address);

}
