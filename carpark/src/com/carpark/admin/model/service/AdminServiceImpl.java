package com.carpark.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.carpark.admin.model.dao.AdminDaoImpl;
import com.carpark.member.model.MemberDto;

public class AdminServiceImpl implements AdminService {

	private static  AdminService adminService;
	
	public static AdminService getAdminService() {
		return adminService;
	}

	static{
		adminService = new AdminServiceImpl();
	}
	
	private AdminServiceImpl(){}
	
	@Override
	public ArrayList<MemberDto> allUserInfo() {
		return AdminDaoImpl.getAdminDaoImpl().allUserInfo();
	}

	@Override
	public List<Map<String, String>> changeUserList() {
		return AdminDaoImpl.getAdminDaoImpl().changeUserList();
	}

	@Override
	public List<Map<String, String>> goodBehaviorUserList() {
		return AdminDaoImpl.getAdminDaoImpl().goodBehaviorUserList();
	}

	@Override
	public List<Map<String, String>> goodUseUserList() {
		return AdminDaoImpl.getAdminDaoImpl().goodUseUserList();
	}

	@Override
	public List<Map<String, String>> popularParkList() {
		return AdminDaoImpl.getAdminDaoImpl().popularParkList();
	}
}
