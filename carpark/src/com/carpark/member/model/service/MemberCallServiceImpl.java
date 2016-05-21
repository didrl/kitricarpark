package com.carpark.member.model.service;

public class MemberCallServiceImpl implements MemberCallService {

	private static MemberCallService memberCallService;
	
	static {
		memberCallService = new MemberCallServiceImpl();
	}
	
	private MemberCallServiceImpl(){}

	public static MemberCallService getMemberCallService() {
		return memberCallService;
	}
	
	
}
