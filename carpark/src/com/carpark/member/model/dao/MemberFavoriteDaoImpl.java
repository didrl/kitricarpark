package com.carpark.member.model.dao;

public class MemberFavoriteDaoImpl implements MemberFavoriteDao {

	private static MemberFavoriteDao memberFavoriteDao;
	
	static {
		memberFavoriteDao = new MemberFavoriteDaoImpl();
	}
	
	private MemberFavoriteDaoImpl(){}

	public static MemberFavoriteDao getMemberFavoriteDao() {
		return memberFavoriteDao;
	}
	
	
}
