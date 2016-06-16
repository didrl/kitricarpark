package com.carpark.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carpark.admin.model.GradeDto;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.common.model.ParkingDto;
import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.dao.MemberDaoImpl;

public class MemberServiceImpl implements MemberService {
	private static MemberService memberService;
	
	private MemberServiceImpl(){
		
	}
	
	static{
		memberService = new MemberServiceImpl();
	}
	
	public static MemberService getMemberService() {
		return memberService;
	}

	@Override
	public int register(MemberDto memberDto) {
		return MemberDaoImpl.getMemberDao().register(memberDto);
	}

	@Override
	public int idcheck(String id) {
		return MemberDaoImpl.getMemberDao().idcheck(id);
	}

	@Override
	public MemberDto getMember(String id) {
		return MemberDaoImpl.getMemberDao().getMember(id);
	}

	@Override
	public int delete(String id) {
		return MemberDaoImpl.getMemberDao().delete(id);
	}

	@Override
	public MemberDto login(String id, String pass) {
		Map<String, String> map = new HashMap<String,String>();
			map.put("userid", id);		
			map.put("userpwd", pass);		
			
		return MemberDaoImpl.getMemberDao().login(map);
	}

	@Override
	public List<ParkingDetailDto> list(Map<String, String> map) {
		return MemberDaoImpl.getMemberDao().list(map);
	}

	@Override
	public ParkingDto parkingDetail(String parkingId) {
		return MemberDaoImpl.getMemberDao().parkingDetail(parkingId);
	}

	@Override
	public int addNewCar(MemberCarDto memberCarDto) {
		return MemberDaoImpl.getMemberDao().addNewCar(memberCarDto);
	}

	public MemberDto getMemberDetail(String id) {
		return MemberDaoImpl.getMemberDao().getMember(id);
	}

	@Override

	public ParkingDetailDto getParkingDetail_info(String park_id) {
		return MemberDaoImpl.getMemberDao().getParkingDetail_info(park_id);
	}

	public int modify(MemberDto memberDto) {
		return MemberDaoImpl.getMemberDao().modify(memberDto);
	}

	@Override
	public GradeDto gradeInfo(String id) {
		return MemberDaoImpl.getMemberDao().gradeInfo(id);
	}

	@Override
	public MemberDto kakaologin(String loginkey) {
		return MemberDaoImpl.getMemberDao().kakaologin(loginkey);
	}

}
