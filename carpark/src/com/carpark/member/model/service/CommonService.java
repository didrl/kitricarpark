package com.carpark.member.model.service;

import com.carpark.util.PageNavigator;

public interface CommonService {

	int getNextSeq();
	PageNavigator getPageNavigator(String id, int bcode, int pg, String key, String word);
	PageNavigator getPageNavigatorAddress(String address, int pg);
	PageNavigator getPageNavigatorParking(String ownerId, int pg, String key, String word);
	PageNavigator getPageNavigatorUser(String userId, int pg, String key, String word);
	PageNavigator getPageNavigatorReceiver(String receiveId, int pg, String key, String word);
	int getNextParkingId();
	
}
