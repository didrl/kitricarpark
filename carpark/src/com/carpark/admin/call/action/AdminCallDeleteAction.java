package com.carpark.admin.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminCallServiceImpl;
import com.carpark.member.model.service.MemberCallServiceImpl;

public class AdminCallDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int seq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("delete seq"+seq);
		AdminCallServiceImpl.getAdminCallService().deleteArticle(seq);
		return "";
	}

}
