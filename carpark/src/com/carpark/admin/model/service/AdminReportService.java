package com.carpark.admin.model.service;

import java.util.List;

import com.carpark.admin.model.PenaltyDto;
import com.carpark.member.model.ReportDto;

public interface AdminReportService {

	int writeArticle(PenaltyDto penaltyDto);
	ReportDto viewArticle(int seq);
	List<ReportDto> listArticle(int pg, String key, String word);
	List<ReportDto> listFlagArticle(String flag, int pg, String key, String word);
	void modifyArticle(int seq);
	int penaltyPoint(String userId);
	
}
