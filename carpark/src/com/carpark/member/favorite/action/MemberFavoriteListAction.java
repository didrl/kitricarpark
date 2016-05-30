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

public class MemberFavoriteListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		
		ArrayList<FavoriteDto> favoritelist =	(ArrayList<FavoriteDto>) MemberFavoriteServiceImpl.getMemberFavoriteService().favoritelist(memberDto.getUser_id());
		request.setAttribute("favoritelist", favoritelist);
		
		return "/member/myfavoriteparking.jsp";
	}

}
