package com.carpark.member.model.service;

import java.util.List;
import java.util.Map;

import com.carpark.member.model.CoinDto;
import com.carpark.member.model.dao.MemberCoinDaoImpl;
import com.carpark.member.model.dao.MemberMessageDaoImpl;

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

	@Override
	public int chargeCoin(CoinDto coindto,int coin) {
		
		return MemberCoinDaoImpl.getMemberCoinDao().chargeCoin(coindto, coin);
		
	}
}
