package com.carpark.member.model.service;

public class MemberReviewServiceImpl implements MemberReviewService {
	
	private static MemberReviewService memberReviewService;
	
	static {
		memberReviewService = new MemberReviewServiceImpl();
	}
	
	private MemberReviewServiceImpl(){}

	public static MemberReviewService getMemberReviewService() {
		return memberReviewService;
	}
	
	
}
