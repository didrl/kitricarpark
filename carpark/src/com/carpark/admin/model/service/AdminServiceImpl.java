package com.carpark.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.carpark.admin.model.StatsChangeUserDto;
import com.carpark.admin.model.StatsGoodBehaviorUsersDto;
import com.carpark.admin.model.StatsGoodUseUserDto;
import com.carpark.admin.model.StatsPopularParkDto;
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
	public List<StatsChangeUserDto> changeUserList() {
		return AdminDaoImpl.getAdminDaoImpl().changeUserList();
	}

	@Override
	public List<StatsGoodBehaviorUsersDto> goodBehaviorUserList() {
		return AdminDaoImpl.getAdminDaoImpl().goodBehaviorUserList();
	}

	@Override
	public List<StatsGoodUseUserDto> goodUseUserList() {
		return AdminDaoImpl.getAdminDaoImpl().goodUseUserList();
	}

	@Override
	public List<StatsPopularParkDto> popularParkList() {
		return AdminDaoImpl.getAdminDaoImpl().popularParkList();
	}
}
