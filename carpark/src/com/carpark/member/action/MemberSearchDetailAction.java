package com.carpark.member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.ParkingDetailDto;
import com.carpark.admin.model.ParkingDto;
import com.carpark.admin.model.ParkingFacilityDto;
import com.carpark.member.model.ReviewDto;
import com.carpark.member.model.service.MemberReviewServiceImpl;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberSearchDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String park_id= request.getParameter("parkingid");
		ParkingDto parkingDto= MemberServiceImpl.getMemberService().parkingDetail(park_id);
		ArrayList<ReviewDto> reviewlist = MemberReviewServiceImpl.getMemberReviewService().listReview(park_id);
		
		ParkingFacilityDto parkingFacilityDto = MemberServiceImpl.getMemberService().getParkingFacility_info(park_id);
		
		request.setAttribute("parkingDetail", parkingDto);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("parkingFacilityDto", parkingFacilityDto);
		
		return "/search/searchResultDetail.jsp";
	}

}