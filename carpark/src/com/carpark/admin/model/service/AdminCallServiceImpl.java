package com.carpark.admin.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.carpark.admin.model.dao.AdminCallDaoImpl;
import com.carpark.common.model.CallDto;
import com.carpark.db.DBConnection;

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
		return AdminCallDaoImpl.getAdminCallDao().viewArticle(seq);
	}

	@Override
	public List<CallDto> receiveListArticle(String receiveId) {
		return AdminCallDaoImpl.getAdminCallDao().receiveListArticle(receiveId);
	}

	@Override
	public void deleteArticle(int seq) {
		AdminCallDaoImpl.getAdminCallDao().deleteArticle(seq);
	}

	@Override
	public int callConfirm(int seq) {
		return AdminCallDaoImpl.getAdminCallDao().callConfirm(seq);
	}


}
