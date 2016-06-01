package com.carpark.member.reservation.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReservationDto;
import com.carpark.member.model.service.MemberReservationServiceImpl;
public class MemberReservationListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();

		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		
		 ArrayList<ReservationDto> list = ( ArrayList<ReservationDto>) MemberReservationServiceImpl.getMemberReservationService().myReservationList(memberDto.getUser_id());
		 request.setAttribute("myreservationlist", list);
		return "/member/myReservation.jsp";
	}

}
