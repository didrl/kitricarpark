package com.carpark.member.model.service;

import java.util.List;

import com.carpark.member.model.MessageDto;

public interface MemberMessageService {

	int writeArticle(MessageDto messageDto);
	MessageDto viewArticle(int seq);
	List<MessageDto> listArticle(int bcode, int pg, String key, String word);
	void deleteArticle(int seq);
	
}
