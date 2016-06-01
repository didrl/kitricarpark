package com.carpark.admin.model.service;

import java.util.List;

import com.carpark.admin.model.dao.AdminCallDaoImpl;
import com.carpark.common.model.CallDto;

public class AdminCallServiceImpl implements AdminCallService {
	
	private static AdminCallService adminCallService;
	
	private AdminCallServiceImpl(){}
	
	static {
		adminCallService = new AdminCallServiceImpl();
	}
	
	public static AdminCallService getAdminCallService() {
		return adminCallService;
	}

	@Override
	public CallDto viewArticle(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CallDto> receiveListArticle(String receiveId) {
		return AdminCallDaoImpl.getAdminCallDao().receiveListArticle(receiveId);
	}

	@Override
	public void deleteArticle(int seq) {
		// TODO Auto-generated method stub
		
	}

}
