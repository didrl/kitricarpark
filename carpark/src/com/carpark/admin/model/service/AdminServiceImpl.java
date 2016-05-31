package com.carpark.admin.model.service;

import java.util.ArrayList;

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
		System.out.println("admin Service Imple" + AdminDaoImpl.getAdminDaoImpl().allUserInfo().size());
		return AdminDaoImpl.getAdminDaoImpl().allUserInfo();
	}
}
