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
	public List<MessageDto> sendListArticle(String userId) {//보낸쪽지리스트
		return MemberMessageDaoImpl.getMemberMessageDao().sendListArticle(userId);
	}

	@Override
	public List<MessageDto> receiveListArticle(String receiveId) {//받은쪽지리스트
		return MemberMessageDaoImpl.getMemberMessageDao().receiveListArticle(receiveId);
	}
	
	
}
