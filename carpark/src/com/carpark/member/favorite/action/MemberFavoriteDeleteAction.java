package com.carpark.member.favorite.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.FavoriteDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberFavoriteServiceImpl;

public class MemberFavoriteDeleteAction implements Action {
  
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		FavoriteDto favoriteDto = new FavoriteDto();
		
		favoriteDto.setUser_id(memberDto.getUser_id());
		favoriteDto.setPark_id(Integer.parseInt(request.getParameter("park_id")));
		
		
		MemberFavoriteServiceImpl.getMemberFavoriteService().delfavortie(favoriteDto);
		ArrayList<FavoriteDto> favoritelist = (ArrayList<FavoriteDto>) MemberFavoriteServiceImpl.getMemberFavoriteService().favoritelist(memberDto.getUser_id());
		session.setAttribute("favoritelist", favoritelist);
		return "/search/searchResultDetail.jsp";
	}

}
