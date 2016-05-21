package com.carpark.member.model.service;

import java.util.Map;

import com.carpark.member.model.MemberDto;

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

	public static void setMemberService(MemberService memberService) {
		MemberServiceImpl.memberService = memberService;
	}

	@Override
	public int register(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return 0;
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
	public MemberDto login(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
