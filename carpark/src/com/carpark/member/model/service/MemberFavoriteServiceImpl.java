package com.carpark.member.model.service;

import java.util.List;
import java.util.Map;

import com.carpark.common.model.ParkingViewDto;
import com.carpark.member.model.FavoriteDto;
import com.carpark.member.model.dao.MemberFavoriteDaoImpl;

public class MemberFavoriteServiceImpl implements MemberFavoriteService {

	private static MemberFavoriteService memberFavoriteService;
	
	static {
		memberFavoriteService = new MemberFavoriteServiceImpl();
	}
	
	private MemberFavoriteServiceImpl(){}

	public static MemberFavoriteService getMemberFavoriteService() {
		return memberFavoriteService;
	}

	@Override
	public void addfavortie(FavoriteDto favoriteDto) {
		MemberFavoriteDaoImpl.getMemberFavoriteDao().addfavortie(favoriteDto);
	}

	@Override
	public void delfavortie(FavoriteDto favoriteDto) {
		MemberFavoriteDaoImpl.getMemberFavoriteDao().delfavortie(favoriteDto);
	}

	@Override
	public List<FavoriteDto> favoritelist(String user_id) {
		return MemberFavoriteDaoImpl.getMemberFavoriteDao().favoritelist(user_id);
	}

	@Override
	public ParkingViewDto getParkingView(int park_id) {
		return MemberFavoriteDaoImpl.getMemberFavoriteDao().getParkingView(park_id);
	}


	
}
