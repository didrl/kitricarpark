package com.carpark.member.model.dao;

import java.util.List;

import com.carpark.common.model.CallDto;
import com.carpark.common.model.ZipDto;

public interface MemberCallDao {
	List<ZipDto> zipSearchList(String dong);
	int register(CallDto callDto);
	List<CallDto>sendList(String id);
	CallDto sendView(int seq);
	int modify(CallDto callDto);
	int delete(int seq);
}
