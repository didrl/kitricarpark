package com.carpark.member.model.service;

public class MemberFavoriteServiceImpl implements MemberFavoriteService {

	private static MemberFavoriteService memberFavoriteService;
	
	static {
		memberFavoriteService = new MemberFavoriteServiceImpl();
	}
	
	private MemberFavoriteServiceImpl(){}

	public static MemberFavoriteService getMemberFavoriteService() {
		return memberFavoriteService;
	}
	
	
}
