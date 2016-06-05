package com.carpark.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.carpark.member.model.ReviewDto;
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
		return MemberReviewDaoImpl.getMemberReviewDao().viewArticle(seq);
	}

	@Override
	public int writeArticle(ReviewDto reviewDto) {
		return MemberReviewDaoImpl.getMemberReviewDao().writeArticle(reviewDto);
	}

	@Override
	public List<ReviewDto> sendListArticle(String userId) {
		return MemberReviewDaoImpl.getMemberReviewDao().sendListArticle(userId);
	}

	@Override
	public List<ReviewDto> receiveListArticle(String receiveId) {
		return MemberReviewDaoImpl.getMemberReviewDao().receiveListArticle(receiveId);
	}

	@Override
	public void deleteArticle(int seq) {
		MemberReviewDaoImpl.getMemberReviewDao().deleteArticle(seq);
	}
	
	
}
