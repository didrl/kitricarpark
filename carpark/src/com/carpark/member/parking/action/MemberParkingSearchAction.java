package com.carpark.member.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.factory.MemberActionFactory;
import com.carpark.member.model.service.MemberParkingServiceImpl;

public class MemberParkingSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String parkAddress = request.getParameter("parkAddress");
		MemberParkingServiceImpl.getMemberParkingservice().ParkSearch(parkAddress);
		
		return "/parking/parksearch.jsp";
	}

}
