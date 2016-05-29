package com.carpark.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.carpark.member.model.ReviewDto;

public interface MemberReviewDao {
	
	ReviewDto viewArticle(int seq);
	ArrayList<ReviewDto> listReview(String park_id);
	int writeArticle(ReviewDto reviewDto);
	List<ReviewDto> sendListArticle(String userId);
	List<ReviewDto> receiveListArticle(String receiveId);
	void deleteArticle(int seq);	
}
