package com.carpark.member.model.service;

import java.util.List;

import com.carpark.common.model.CallDto;
import com.carpark.common.model.ZipDto;

public interface MemberCallService {
	List<ZipDto> zipSearchList(String dong);
	int register(CallDto callDto);
	List<CallDto>sendList(String id);
	CallDto sendView(int seq);
}
