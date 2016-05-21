package com.carpark.member.model.dao;

public class MemberReviewDaoImpl implements MemberReviewDao {

	private static MemberReviewDao memberReviewDao;
	
	static {
		memberReviewDao = new MemberReviewDaoImpl();
	}
	
	private MemberReviewDaoImpl(){}

	public static MemberReviewDao getMemberReviewDao() {
		return memberReviewDao;
	}
	
	
}
