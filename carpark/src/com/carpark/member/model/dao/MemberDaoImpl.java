package com.carpark.member.model.dao;

import java.util.Map;

import com.carpark.member.model.MemberDto;

public class MemberDaoImpl implements MemberDao {
	private static MemberDao memberDao;
	
	private MemberDaoImpl(){}
	
	static{
		memberDao = new MemberDaoImpl();
	}
	
	public static MemberDao getMemberDao() {
		return memberDao;
	}

	public static void setMemberDao(MemberDao memberDao) {
		MemberDaoImpl.memberDao = memberDao;
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
