package com.carpark.member.model.service;

import java.util.List;
import java.util.Map;

import com.carpark.admin.model.GradeDto;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.common.model.ParkingDto;
import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.MemberDto;

public interface MemberService {
	int register(MemberDto memberDto);
	int idcheck(String id);
	MemberDto getMember(String id);
	MemberDto getMemberDetail(String id);	
	int modify(MemberDto memberDto);
	int delete(String id);
	MemberDto login(String id ,String pass);	
	List<ParkingDetailDto>list(Map<String,String> map);
	ParkingDto parkingDetail(String parkingId);
	ParkingDetailDto getParkingDetail_info(String park_id);
	int addNewCar(MemberCarDto memberCarDto);
	GradeDto gradeInfo(String id);
}
