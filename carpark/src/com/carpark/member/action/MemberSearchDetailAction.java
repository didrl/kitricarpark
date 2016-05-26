package com.carpark.member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.ParkingDto;
import com.carpark.member.model.ReviewDto;
import com.carpark.member.model.service.MemberReservationServiceImpl;
import com.carpark.member.model.service.MemberReviewServiceImpl;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberSearchDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String parkingId= request.getParameter("parkingid");
		ParkingDto parkingDto= MemberServiceImpl.getMemberService().parkingDetail(parkingId);
		ArrayList<ReviewDto> reviewlist = MemberReviewServiceImpl.getMemberReviewService().getReview(parkingId);
		
		request.setAttribute("parkingDetail", parkingDto);
		request.setAttribute("reviewlist", reviewlist);
		// maybe parking_info will be Dto here
		
		return "/search/searchResultDetail.jsp";
	}

}


//get data
//parkingDto.setPark_id(rs.getInt("park_id"));
//parkingDto.setPark_name(rs.getString("park_name"));
//parkingDto.setLocation(rs.getString("city")); 		
//parkingDto.setPark_capacity(rs.getInt("park_capacity"));
//parkingDto.setLongitude(rs.getInt("longitude"));
//parkingDto.setLatitude(rs.getInt("latitude"));

//have to add data
// feature, detail_info, photo