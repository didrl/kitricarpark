package com.carpark.member.model.service;

import java.util.List;

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
	public List<ZipDto> list(String dong) {
		return MemberCallDaoImpl.getMemberCallDao().zipSearch(dong);
	}
	
	
}
