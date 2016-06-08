package com.carpark.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.carpark.admin.model.StatsChangeUserDto;
import com.carpark.admin.model.StatsGoodBehaviorUsersDto;
import com.carpark.admin.model.StatsGoodUseUserDto;
import com.carpark.admin.model.StatsPopularParkDto;
import com.carpark.member.model.MemberDto;

public interface AdminDao {
	ArrayList<MemberDto> allUserInfo();

	List<StatsChangeUserDto> changeUserList();
	List<StatsGoodBehaviorUsersDto> goodBehaviorUserList();
	List<StatsGoodUseUserDto> goodUseUserList();
	List<StatsPopularParkDto> popularParkList();
}
