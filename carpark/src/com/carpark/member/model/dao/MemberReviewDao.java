package com.carpark.member.model.dao;

import java.util.ArrayList;

import com.carpark.member.model.ReviewDto;

public interface MemberReviewDao {
	ArrayList<ReviewDto> getReview(String park_id);
}
