package com.carpark.member.model.service;

import com.carpark.member.model.dao.CommonDaoImpl;
import com.carpark.util.PageNavigator;

public class CommonServiceImpl implements CommonService {
	
	private static CommonService commonService;
	
	static {
		commonService = new CommonServiceImpl();
	}
	
	private CommonServiceImpl(){}

	public static CommonService getCommonService() {
		return commonService;
	}

	@Override
	public int getNextSeq() {
		return CommonDaoImpl.getCommonDao().getNextSeq();
	}

	@Override
	public PageNavigator getPageNavigator(int bcode, int pg, String key, String word) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getNextParkingId() {
		return CommonDaoImpl.getCommonDao().getNextParkingId();
	}

}
