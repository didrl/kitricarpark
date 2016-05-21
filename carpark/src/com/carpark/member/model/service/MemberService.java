package com.carpark.member.model.service;

import java.util.Map;

import com.carpark.member.model.MemberDto;

public interface MemberService {
	int register(MemberDto memberDto);
	int idcheck(String id);
	MemberDto getMember(String id);
	int modify(MemberDto memberDto);
	int delete(String id);
	MemberDto login(String id ,String pass);	
}
