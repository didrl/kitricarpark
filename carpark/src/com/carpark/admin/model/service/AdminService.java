package com.carpark.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.carpark.member.model.MemberDto;

public interface AdminService {
	ArrayList<MemberDto> allUserInfo();

	List<Map<String, String>> changeUserList();
	List<Map<String, String>> goodBehaviorUserList();
	List<Map<String, String>> goodUseUserList();
	List<Map<String, String>> popularParkList();
}
