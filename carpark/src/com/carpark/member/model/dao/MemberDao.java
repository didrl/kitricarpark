package com.carpark.member.model.dao;

import java.util.Map;

import com.carpark.member.model.MemberDto;

public interface MemberDao {
	int register(MemberDto memberDto);
	int idcheck(String id);
	MemberDto getMember(String id);
	int modify(MemberDto memberDto);
	int delete(String id);
	MemberDto login(Map<String ,String> map);	
}
