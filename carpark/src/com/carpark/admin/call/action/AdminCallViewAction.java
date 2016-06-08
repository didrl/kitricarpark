package com.carpark.admin.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminCallService;
import com.carpark.admin.model.service.AdminCallServiceImpl;
import com.carpark.common.model.CallDto;

public class AdminCallViewAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		
		return "";
	}

}
