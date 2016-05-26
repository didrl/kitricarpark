package com.carpark.member.model.service;

import java.util.ArrayList;

import com.carpark.member.model.ReviewDto;
import com.carpark.member.model.dao.MemberDaoImpl;
import com.carpark.member.model.dao.MemberReviewDaoImpl;

public class MemberReviewServiceImpl implements MemberReviewService {
	
	private static MemberReviewService memberReviewService;
	
	static {
		memberReviewService = new MemberReviewServiceImpl();
	}
	
	private MemberReviewServiceImpl(){}

	public static MemberReviewService getMemberReviewService() {
		return memberReviewService;
	}

	@Override
	public ArrayList<ReviewDto> getReview(String park_id) {
		return MemberReviewDaoImpl.getMemberReviewDao().getReview(park_id);
	}
	
	
}
