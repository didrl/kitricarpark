package com.carpark.admin.parking.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminParkingServiceImpl;
import com.carpark.util.NumberCheck;
import com.carpark.util.StringCheck;

public class AdminParkingVisitAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String act = request.getParameter("act");
		String visit = StringCheck.nullToBlank(request.getParameter("visit"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		String flag = request.getParameter("flag");
		
		String parkId = request.getParameter("parkId");
		
		AdminParkingServiceImpl.getAdminParkingService().adminParkingVisit(parkId);
		
		return "index.jsp";
	}

}
