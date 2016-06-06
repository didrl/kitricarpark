package com.carpark.member.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.common.model.ZipDto;
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.util.Encoder;

public class MemberParkingSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String parkAddress = Encoder.isoToUtf(request.getParameter("parkAddress"));
		List<ZipDto> list = MemberParkingServiceImpl.getMemberParkingservice().parkingSearch(parkAddress);
		request.setAttribute("addressList", list);
		
		return "/parking/parksearch.jsp";
	}

}
