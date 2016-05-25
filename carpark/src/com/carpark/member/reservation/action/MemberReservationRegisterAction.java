package com.carpark.member.reservation.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.ReservationDto;
import com.carpark.member.model.service.MemberReservationServiceImpl;

public class MemberReservationRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		ReservationDto reservationDto = new ReservationDto();
		
		
		reservationDto.setUser_id(request.getParameter("id"));
		reservationDto.setPark_id(Integer.parseInt(request.getParameter("park_id")));
		reservationDto.setFromdate(request.getParameter("fromdate"));
		reservationDto.setTodate(request.getParameter("todate"));
		reservationDto.setFromtime(Integer.parseInt(request.getParameter("fromTime")));
		reservationDto.setTotime(Integer.parseInt(request.getParameter("toTime")));
		
		MemberReservationServiceImpl.getMemberReservationService().registerReservation(reservationDto);

		
		
		return "/carpark/index.jsp";
	}

}
