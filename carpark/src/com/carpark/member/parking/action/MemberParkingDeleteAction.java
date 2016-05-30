package com.carpark.member.parking.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.member.model.service.MemberParkingServiceImpl;

public class MemberParkingDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		int parkId = Integer.parseInt(request.getParameter("parkID"));
		MemberParkingServiceImpl.getMemberParkingservice().MemberParkingDelete(parkId);
		
		return "parking/list.jsp";
	}

}
