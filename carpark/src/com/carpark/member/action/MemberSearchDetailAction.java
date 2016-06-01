package com.carpark.member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.common.model.ParkingDto;
import com.carpark.common.model.ParkingFacilityDto;
import com.carpark.member.model.FavoriteDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReviewDto;
import com.carpark.member.model.service.MemberFavoriteServiceImpl;
import com.carpark.member.model.service.MemberReviewServiceImpl;
import com.carpark.member.model.service.MemberServiceImpl;

public class MemberSearchDetailAction implements Action {
 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");

		
		String park_id= request.getParameter("parkingid");
		ParkingDto parkingDto= MemberServiceImpl.getMemberService().parkingDetail(park_id);
		ArrayList<ReviewDto> reviewlist = MemberReviewServiceImpl.getMemberReviewService().listReview(park_id);
		ParkingFacilityDto parkingFacilityDto = MemberServiceImpl.getMemberService().getParkingFacility_info(park_id);
		ArrayList<FavoriteDto> favoritelist;
		
		session.setAttribute("parkingDetail", parkingDto);
		session.setAttribute("reviewlist", reviewlist);
		session.setAttribute("parkingFacilityDto", parkingFacilityDto);
		
		if(memberDto != null){
			favoritelist = (ArrayList<FavoriteDto>) MemberFavoriteServiceImpl.getMemberFavoriteService().favoritelist(memberDto.getUser_id());
			session.setAttribute("favoritelist",favoritelist);
		}

		return "/search/searchResultDetail.jsp";
	}

}