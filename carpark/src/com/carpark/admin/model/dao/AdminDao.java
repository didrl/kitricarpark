package com.carpark.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.carpark.member.model.MemberDto;

public interface AdminDao {
	ArrayList<MemberDto> allUserInfo();
	
	List<Map<String,String>> changeUserList();
	List<Map<String,String>> goodBehaviorUserList();
	List<Map<String,String>> goodUseUserList();
	List<Map<String,String>> popularParkList();
}
