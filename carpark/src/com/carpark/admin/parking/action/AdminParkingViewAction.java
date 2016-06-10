package com.carpark.admin.parking.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.member.model.service.MemberReportServiceImpl;
import com.carpark.util.NumberCheck;

public class AdminParkingViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int parkId = NumberCheck.nullToZero(request.getParameter("parkId"));
		System.out.println("parkid" + parkId);
		if(parkId != 0) {
			ParkingDetailDto parkingDto = MemberParkingServiceImpl.getMemberParkingservice().parkingView(parkId);
			request.setAttribute("parkingView", parkingDto);
		}
		return "/admin/parking/view.jsp";
	}

}
