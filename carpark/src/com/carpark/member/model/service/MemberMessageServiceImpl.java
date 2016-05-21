package com.carpark.member.model.service;

public class MemberMessageServiceImpl implements MemberMessageService {

	private static MemberMessageService memberMessageService;
	
	static {
		memberMessageService = new MemberMessageServiceImpl();
	}
	
	private MemberMessageServiceImpl(){}

	public static MemberMessageService getMemberMessageService() {
		return memberMessageService;
	}
	
	
}
