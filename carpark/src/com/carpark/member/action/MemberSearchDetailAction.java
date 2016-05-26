package com.carpark.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.ParkingDto;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberSearchDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String parkingId= request.getParameter("parkingid");
		ParkingDto parkingDto= MemberServiceImpl.getMemberService().parkingDetail(parkingId);
		request.setAttribute("parkingDetail", parkingDto);
		return "/search/searchResultDetail.jsp";
	}

}
