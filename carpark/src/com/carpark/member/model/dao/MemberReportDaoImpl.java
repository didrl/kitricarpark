package com.carpark.member.model.dao;

public class MemberReportDaoImpl implements MemberReportDao {

	private static MemberReportDao memberReportDao;
	
	static {
		memberReportDao = new MemberReportDaoImpl();
	}
	
	private MemberReportDaoImpl(){}

	public static MemberReportDao getMemberReportDao() {
		return memberReportDao;
	}
	
	
}
