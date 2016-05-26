package com.carpark.member.model.service;

import java.util.*;

import com.carpark.member.model.MessageDto;
import com.carpark.member.model.dao.MemberMessageDaoImpl;
import com.carpark.util.BoardConstance;

public class MemberMessageServiceImpl implements MemberMessageService {

	private static MemberMessageService memberMessageService;
	
	static {
		memberMessageService = new MemberMessageServiceImpl();
	}
	
	private MemberMessageServiceImpl(){}

	public static MemberMessageService getMemberMessageService() {
		return memberMessageService;
	}

	@Override
	public int writeArticle(MessageDto messageDto) {
		return MemberMessageDaoImpl.getMemberMessageDao().writeArticle(messageDto);
	}

	@Override
	public MessageDto viewArticle(int seq) {
		return MemberMessageDaoImpl.getMemberMessageDao().viewArticle(seq);
	}

	@Override
	public List<MessageDto> searchArticle(int bcode, int pg, String key, String word) {
		Map<String, String> map = new HashMap<String, String>();
		
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end = BoardConstance.BOARD_LIST_SIZE;
		
		map.put("bcode", bcode + "");
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("key", key);
		map.put("word", word);
		
		//return MemberMessageDaoImpl.getMemberMessageDao().listArticle(map);
		return null;
	}

	@Override
	public void deleteArticle(int seq) {
		MemberMessageDaoImpl.getMemberMessageDao().deleteArticle(seq);
		
	}

	@Override
	public List<MessageDto> sendListArticle(String userId) {
		return MemberMessageDaoImpl.getMemberMessageDao().sendListArticle(userId);
	}

	@Override
	public List<MessageDto> receiveListArticle(String receiveId) {
		return MemberMessageDaoImpl.getMemberMessageDao().receiveListArticle(receiveId);
	}
	
	
}
