package com.carpark.member.model.dao;

public class MemberMessageDaoImpl implements MemberMessageDao {

	private static MemberMessageDao memberMessageDao;
	
	static {
		memberMessageDao = new MemberMessageDaoImpl();
	}
	
	private MemberMessageDaoImpl(){}

	public static MemberMessageDao getMemberMessageDao() {
		return memberMessageDao;
	}
	
	
}
