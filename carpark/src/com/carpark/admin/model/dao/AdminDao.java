package com.carpark.admin.model.dao;

import java.util.ArrayList;

import com.carpark.member.model.MemberDto;

public interface AdminDao {
	ArrayList<MemberDto> allUserInfo();
}
