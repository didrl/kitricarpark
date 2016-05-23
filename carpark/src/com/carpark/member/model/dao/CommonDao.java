package com.carpark.member.model.dao;

import java.util.Map;

public interface CommonDao {

	public int getNextSeq();
	void updateHit(int seq);
	int newArticleCount(int bcode);
	int totalArticleCount(Map<String, String> map);
	
}
