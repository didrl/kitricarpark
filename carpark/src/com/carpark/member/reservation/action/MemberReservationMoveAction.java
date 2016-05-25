package com.carpark.member.reservation.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.ReservationDto;
import com.carpark.member.model.service.MemberReservationServiceImpl;

public class MemberReservationMoveAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		

		// if searchResultDetail can not give some info then get that info in DB
		
		// have to change when get some additional parking info 
		//		ex) near landmarks, discount info . . .
		
		
		//fromdate, fromtime
		//todate, totime
		HttpSession session = request.getSession();
		ReservationDto reservationDto = new ReservationDto();
		Map<String,String> map;
		String user_id = request.getParameter("id");
		int park_id = Integer.parseInt(request.getParameter("park_id"));
		
		reservationDto.setUser_id(user_id);
		ArrayList<Map<String,String>> carinfo=MemberReservationServiceImpl.getMemberReservationService().getCarInfo(user_id);
		ArrayList<Map<String,String>> availabledate =MemberReservationServiceImpl.getMemberReservationService().getAvailDate(park_id);
		reservationDto.setFromdate(request.getParameter("fromdate"));
		reservationDto.setTodate(request.getParameter("todate"));
		reservationDto.setFromtime(Integer.parseInt(request.getParameter("fromTime")));
		reservationDto.setTotime(Integer.parseInt(request.getParameter("toTime")));
		
		//parkingDto 
		reservationDto.setPark_id(park_id);
		reservationDto.setPark_name(request.getParameter("park_name"));

		
		request.setAttribute("reservationDto", reservationDto);
		request.setAttribute("carinfo", carinfo);
		request.setAttribute("availabledate", availabledate);
		
		return "/reservation/reservationDetail.jsp";
	}

}
