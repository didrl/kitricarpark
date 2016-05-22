package com.carpark.member.model.service;

import java.util.HashMap;
import java.util.Map;

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
		// TODO Auto-generated method stub
		return null;
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

}
