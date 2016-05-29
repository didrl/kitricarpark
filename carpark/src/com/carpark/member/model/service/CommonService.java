package com.carpark.member.model.service;

import com.carpark.util.PageNavigator;

public interface CommonService {

	int getNextSeq();
	PageNavigator getPageNavigator(int bcode, int pg, String key, String word);
	int getNextParkingId();
	
}
