package com.carpark.member.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.ParkingDetailDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberParkingServiceImpl;

public class MemberParkingListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
//		String ownerId = "didrl";
		String ownerId = memberDto.getUser_id();
		if(ownerId != null) {
			
			List<ParkingDetailDto> list = MemberParkingServiceImpl.getMemberParkingservice().MemberParkingList(ownerId);
			request.setAttribute("parkList", list);
		}
		
		return "/parking/list.jsp";
	}

}
