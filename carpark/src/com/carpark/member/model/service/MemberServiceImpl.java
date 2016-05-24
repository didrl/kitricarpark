package com.carpark.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carpark.admin.model.ParkingDto;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDto getMember(String id) {
		return MemberDaoImpl.getMemberDao().getMember(id);
	}

	@Override
	public int modify(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDto login(String id, String pass) {
		Map<String, String> map = new HashMap<String,String>();
			map.put("userid", id);		
			map.put("userpwd", pass);		
			
		return MemberDaoImpl.getMemberDao().login(map);
	}

	@Override
	public List<ParkingDto> list(Map<String, String> map) {
		
		return MemberDaoImpl.getMemberDao().list(map);
	}

}
