package com.carpark.admin.model.service;

import java.util.List;

import com.carpark.common.model.CallDto;

public interface AdminCallService {
	CallDto viewArticle(int seq);
	List<CallDto> receiveListArticle(String receiveId);	
	int callConfirm(int seq);
	void deleteArticle(int seq);
}
