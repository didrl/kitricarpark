package com.carpark.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.carpark.admin.model.StatsChangeUserDto;
import com.carpark.admin.model.StatsGoodBehaviorUsersDto;
import com.carpark.admin.model.StatsGoodUseUserDto;
import com.carpark.admin.model.StatsPopularParkDto;
import com.carpark.member.model.MemberDto;

public interface AdminService {
	ArrayList<MemberDto> allUserInfo();

	List<StatsChangeUserDto> changeUserList();
	List<StatsGoodBehaviorUsersDto> goodBehaviorUserList();
	List<StatsGoodUseUserDto> goodUseUserList();
	List<StatsPopularParkDto> popularParkList();
}
