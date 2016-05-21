package com.carpark.member.model.dao;

public class MemberCallDaoImpl implements MemberCallDao {

	private static MemberCallDao memberCallDao;
	
	static {
		memberCallDao = new MemberCallDaoImpl();
	}
	
	private MemberCallDaoImpl(){}

	public static MemberCallDao getMemberCallDao() {
		return memberCallDao;
	}
	
	
}
