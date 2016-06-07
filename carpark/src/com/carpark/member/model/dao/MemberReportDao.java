package com.carpark.member.model.dao;

import java.util.List;
import java.util.Map;

import com.carpark.member.model.ReportDto;

public interface MemberReportDao {
	
	int writeArticle(ReportDto reportDto);
	ReportDto viewArticle(int seq);
	List<ReportDto> listArticle(Map<String, String> map);
	void deleteArticle(int seq);

}
