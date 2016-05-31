package com.carpark.member.model.dao;

import java.util.List;
import java.util.Map;

import com.carpark.member.model.MessageDto;

public interface MemberMessageDao {

	int writeArticle(MessageDto messageDto);
	MessageDto viewArticle(int seq);
	List<MessageDto> sendListArticle(Map<String, String> map);
	List<MessageDto> receiveListArticle(Map<String, String> map);
	void deleteArticle(int seq);
	
}
