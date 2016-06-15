package com.carpark.admin.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminServiceImpl;

public class AdminLoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		
		List<Map<String, String>> changeUserList = AdminServiceImpl.getAdminService().changeUserList(); 
		List<Map<String, String>> goodBehaviorUserList = AdminServiceImpl.getAdminService().goodBehaviorUserList();
		List<Map<String, String>> goodUseUserList = AdminServiceImpl.getAdminService().goodUseUserList();
		List<Map<String, String>> popularParkList = AdminServiceImpl.getAdminService().popularParkList();
		
		session.setAttribute("changeUserList", changeUserList);
		session.setAttribute("goodBehaviorUserList", goodBehaviorUserList);
		session.setAttribute("goodUseUserList", goodUseUserList);
		session.setAttribute("popularParkList", popularParkList);
		
		return "/admin/adminindex.jsp";
	}

}
