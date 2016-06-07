package com.carpark.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.carpark.admin.model.PenaltyDto;
import com.carpark.member.model.ReportDto;

public interface AdminReportDao {
	
	int writeArticle(PenaltyDto penaltyDto);
	ReportDto viewArticle(int seq);
	List<ReportDto> listArticle(Map<String, String> map);
	List<ReportDto> listFlagArticle(Map<String, String> map);
	void modifyArticle(int seq);
	int penaltyPoint(String userId);

}
