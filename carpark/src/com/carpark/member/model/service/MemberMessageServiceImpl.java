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
	public int writeArticle(MessageDto messageDto) {//쪽지보내기
		return MemberMessageDaoImpl.getMemberMessageDao().writeArticle(messageDto);
	}

	@Override
	public MessageDto viewArticle(int seq) {//쪽지보기
		return MemberMessageDaoImpl.getMemberMessageDao().viewArticle(seq);
	}

	@Override
	public void deleteArticle(int seq) {//쪽지삭제
		MemberMessageDaoImpl.getMemberMessageDao().deleteArticle(seq);
		
	}

	@Override
	public List<MessageDto> sendListArticle(String userId, int pg, String key, String word) {//보낸쪽지리스트
		Map<String, String> map = new HashMap<String, String>();
		
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		
		map.put("userId", userId);
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("key", key);
		map.put("word", word);
		return MemberMessageDaoImpl.getMemberMessageDao().sendListArticle(map);
	}

	@Override
	public List<MessageDto> receiveListArticle(String receiveId, int pg, String key, String word) {//받은쪽지리스트
		Map<String, String> map = new HashMap<String, String>();
		
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		
		map.put("receiveId", receiveId);
		System.out.println("controller" + receiveId);
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("key", key);
		map.put("word", word);
		
		return MemberMessageDaoImpl.getMemberMessageDao().receiveListArticle(map);
	}
	
	
}
