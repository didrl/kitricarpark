package com.carpark.member.model.dao;

import java.util.List;

import com.carpark.common.model.ZipDto;

public interface MemberCallDao {
	List<ZipDto> zipSearch(String dong);
}
