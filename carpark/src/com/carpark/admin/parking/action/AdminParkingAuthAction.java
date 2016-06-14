package com.carpark.admin.parking.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminParkingServiceImpl;

public class AdminParkingAuthAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String parkId = request.getParameter("parkId");
		
		AdminParkingServiceImpl.getAdminParkingService().adminParkingAuth(parkId);
		
		return "index.jsp";
	}

}
