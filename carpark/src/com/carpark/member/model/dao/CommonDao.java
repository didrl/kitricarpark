package com.carpark.member.model.dao;

import java.util.Map;

public interface CommonDao {

	public int getNextSeq();
	void updateHit(int seq);
	int newArticleCount(String id, int bcode);
	int totalArticleCount(Map<String, String> map);
	int totalArticleCountAddress(Map<String, String> map);
	int totalArticleCountParking(Map<String, String> map);
	int totalArticleCountAdminParking(Map<String, String> map);
	int newArticleCountUser(String id, int bcode);
	int totalArticleCountUser(Map<String, String> map);
	int newArticleCountReceiver(String id);
	int totalArticleCountReceiver(Map<String, String> map);
	int totalArticleCountAdminReport(Map<String, String> map);
	int totalArticleCountAdminReportFlag(Map<String, String> map);
	int getNextParkingId();
	
}
