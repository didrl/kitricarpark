package com.carpark.member.model.dao;

import java.util.List;
import java.util.Map;

import com.carpark.admin.model.GradeDto;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.common.model.ParkingDto;
import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.MemberDto;

public interface MemberDao {
	int register(MemberDto memberDto);
	int idcheck(String id);
	MemberDto getMember(String id);
	MemberDto kakaologin(String loginkey);
	int modify(MemberDto memberDto);
	int delete(String id);
	MemberDto login(Map<String ,String> map);
	List<ParkingDetailDto>list(Map<String,String> map);
	ParkingDto parkingDetail(String parkingId);
	int addNewCar(MemberCarDto memberCarDto);
	ParkingDetailDto getParkingDetail_info(String park_id);
	GradeDto gradeInfo(String id);
}
