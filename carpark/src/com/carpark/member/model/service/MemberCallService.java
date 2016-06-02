package com.carpark.member.model.service;

import java.util.List;

import com.carpark.member.model.ZipDto;

public interface MemberCallService {
	List<ZipDto>list(String addr);
}
