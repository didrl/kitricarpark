package com.carpark.admin.model.dao;

import java.util.List;

import com.carpark.admin.model.CallDto;

public interface AdminCallDao {
	CallDto viewArticle(int seq);
	List<CallDto> receiveListArticle(String receiveId);	
	void deleteArticle(int seq);
}
