package com.carpark.member.model.service;

import java.util.List;

import com.carpark.common.model.CallDto;
import com.carpark.common.model.ZipDto;
import com.carpark.member.model.dao.MemberCallDaoImpl;

public class MemberCallServiceImpl implements MemberCallService {

	private static MemberCallService memberCallService;
	
	static {
		memberCallService = new MemberCallServiceImpl();
	}
	
	private MemberCallServiceImpl(){}

	public static MemberCallService getMemberCallService() {
		return memberCallService;
	}

	@Override
	public List<ZipDto> zipSearchList(String dong) {
		return MemberCallDaoImpl.getMemberCallDao().zipSearchList(dong);
	}

	@Override
	public List<CallDto> sendList(String id) {
		return MemberCallDaoImpl.getMemberCallDao().sendList(id);
	}

	@Override
	public int register(CallDto callDto) {
		return MemberCallDaoImpl.getMemberCallDao().register(callDto);
	}

	@Override
	public CallDto sendView(int seq) {
		return MemberCallDaoImpl.getMemberCallDao().sendView(seq);
	}

	@Override
	public int modify(CallDto callDto) {
		return MemberCallDaoImpl.getMemberCallDao().modify(callDto);
	}

	@Override
	public int delete(int seq) {
		return MemberCallDaoImpl.getMemberCallDao().delete(seq);
	}
	
}
