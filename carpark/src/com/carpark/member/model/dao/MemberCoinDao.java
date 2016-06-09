package com.carpark.member.model.dao;

import java.util.List;

import com.carpark.member.model.CoinDto;
import com.carpark.member.model.MemberDto;

public interface MemberCoinDao {
	
	int getMyCoin(String user_id);
	int chargeCoin(CoinDto coindto,int coin);
	List<CoinDto> coinList(String user_id);
}
