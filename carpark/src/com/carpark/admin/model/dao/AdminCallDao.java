package com.carpark.admin.model.dao;

import java.util.List;

import com.carpark.common.model.CallDto;

public interface AdminCallDao {
	CallDto viewArticle(int seq);
	List<CallDto> receiveListArticle(String receiveId);
	int callConfirm(int seq);
	void deleteArticle(int seq);
}
