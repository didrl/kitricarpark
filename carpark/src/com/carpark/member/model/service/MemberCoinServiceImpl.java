package com.carpark.member.model.service;

import java.util.List;
import java.util.Map;

import com.carpark.member.model.dao.MemberCoinDaoImpl;

public class MemberCoinServiceImpl implements MemberCoinService {

	private static MemberCoinService memberCoinService;
	
	static {
		memberCoinService = new MemberCoinServiceImpl();
	}
	
	private MemberCoinServiceImpl(){}

	public static MemberCoinService getMemberCoinService() {
		return memberCoinService;
	}

	@Override
	public int getMyCoin(String user_id) {
		
		return 0;
	}

	


	
}
