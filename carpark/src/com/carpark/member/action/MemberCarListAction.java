package com.carpark.member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberCarDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberReservationServiceImpl;

public class MemberCarListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		ArrayList<MemberCarDto> list = MemberReservationServiceImpl.getMemberReservationService().getCarInfo(memberDto.getUser_id());
		
		request.setAttribute("mycarinfo", list);
		
		return "/member/ownCarList.jsp";
	}

}
