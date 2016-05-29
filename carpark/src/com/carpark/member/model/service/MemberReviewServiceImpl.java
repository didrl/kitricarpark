package com.carpark.member.model.service;

import java.util.ArrayList;
import java.util.List;

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
	public ArrayList<ReviewDto> listReview(String park_id) {
		return MemberReviewDaoImpl.getMemberReviewDao().listReview(park_id);
	}

	@Override
	public ReviewDto viewArticle(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int writeArticle(ReviewDto reviewDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewDto> sendListArticle(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewDto> receiveListArticle(String receiveId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteArticle(int seq) {
		// TODO Auto-generated method stub
		
	}
	
	
}
