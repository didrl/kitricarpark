package com.carpark.member.model.service;

public class MemberReportServiceImpl implements MemberReportService {

	private static MemberReportService memberReportService;
	
	static {
		memberReportService = new MemberReportServiceImpl();
	}
	
	private MemberReportServiceImpl(){}

	public static MemberReportService getMemberReportService() {
		return memberReportService;
	}
	
	
}
