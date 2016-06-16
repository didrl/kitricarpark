package com.carpark.member.model.service;

import java.util.List;
import java.util.Map;

import com.carpark.member.model.MessageDto;

public interface MemberMessageService {

	int writeArticle(MessageDto messageDto);
	MessageDto viewArticle(int seq);
	List<MessageDto> sendListArticle(String userId, int pg, String key, String word);
	List<MessageDto> receiveListArticle(String receiveId, int pg, String key, String word);	
	void deleteArticle(int seq);
	void deleteSendUpdate(int seq);
	void deleteReceiUpdate(int seq);
	
}
