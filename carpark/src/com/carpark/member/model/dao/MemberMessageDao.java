package com.carpark.member.model.dao;

import java.util.List;
import java.util.Map;

import com.carpark.member.model.MessageDto;

public interface MemberMessageDao {

	int writeArticle(MessageDto messageDto);
	MessageDto viewArticle(int seq);
	List<MessageDto> sendListArticle(String userId);
	List<MessageDto> receiveListArticle(String receiveId);
	void deleteArticle(int seq);
	
}
