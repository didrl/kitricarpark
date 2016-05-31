package com.carpark.member.model.dao;

import java.util.List;

import com.carpark.member.model.MemberDto;

public interface MemberCoinDao {
	
	int getMyCoin(String user_id);
}
