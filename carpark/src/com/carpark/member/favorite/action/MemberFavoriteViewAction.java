package com.carpark.member.favorite.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingViewDto;
import com.carpark.member.model.service.MemberFavoriteServiceImpl;

public class MemberFavoriteViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int park_id = Integer.parseInt(request.getParameter("park_id"));
		if (park_id != 0) {
			ParkingViewDto parkingViewDto = MemberFavoriteServiceImpl.getMemberFavoriteService().getParkingView(park_id);
			request.setAttribute("parkingViewDto", parkingViewDto);

			return "/member/myFavoriteParkingview.jsp";
		}
		else
			return "/member/loginFail.jsp";
	}

}
