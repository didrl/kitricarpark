package com.carpark.admin.model.service;

import java.util.List;

import com.carpark.admin.model.CallDto;

public interface AdminCallService {
	CallDto viewArticle(int seq);
	List<CallDto> receiveListArticle(String receiveId);	
	void deleteArticle(int seq);
}
