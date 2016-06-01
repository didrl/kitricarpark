package com.carpark.member.model.service;

import java.util.List;

public class MemberReportServiceImpl implements MemberReportService {

	private static MemberReportService memberReportService;
	
	static {
		memberReportService = new MemberReportServiceImpl();
	}
	
	private MemberReportServiceImpl(){}

	public static MemberReportService getMemberReportService() {
		return memberReportService;
	}

	@Override
	public int writeArticle(ReportDto reportDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReportDto viewArticle(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReportDto> listArticle(String userId, int pg, String key, String word) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
