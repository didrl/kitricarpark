package com.carpark.member.model.service;

import java.util.ArrayList;

import com.carpark.member.model.ReviewDto;

public interface MemberReviewService {
	ArrayList<ReviewDto> getReview(String park_id);
}
