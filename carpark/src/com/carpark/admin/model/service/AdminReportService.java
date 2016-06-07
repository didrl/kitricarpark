package com.carpark.admin.model.service;

import java.util.List;

import com.carpark.member.model.ReportDto;

public interface AdminReportService {

	int writeArticle(ReportDto reportDto);
	ReportDto viewArticle(int seq);
	List<ReportDto> listArticle(int pg, String key, String word);
	List<ReportDto> listFlagArticle(String flag, int pg, String key, String word);
	void modifyArticle(int seq);
	
}
