package com.carpark.member.model.service;

import java.util.List;

import com.carpark.member.model.CoinDto;
import com.carpark.member.model.FavoriteDto;

public interface MemberCoinService {
	int getMyCoin(String user_id);
	int chargeCoin(CoinDto coindto,int coin);
}
