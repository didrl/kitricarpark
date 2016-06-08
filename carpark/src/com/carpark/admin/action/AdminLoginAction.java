package com.carpark.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.StatsChangeUserDto;
import com.carpark.admin.model.StatsGoodBehaviorUsersDto;
import com.carpark.admin.model.StatsGoodUseUserDto;
import com.carpark.admin.model.StatsPopularParkDto;
import com.carpark.admin.model.service.AdminServiceImpl;

public class AdminLoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		
		List<StatsChangeUserDto> changeUserList = AdminServiceImpl.getAdminService().changeUserList(); 
		List<StatsGoodBehaviorUsersDto> goodBehaviorUserList = AdminServiceImpl.getAdminService().goodBehaviorUserList();
		List<StatsGoodUseUserDto> goodUseUserList = AdminServiceImpl.getAdminService().goodUseUserList();
		List<StatsPopularParkDto> popularParkList = AdminServiceImpl.getAdminService().popularParkList();
		
		session.setAttribute("changeUserList", changeUserList);
		session.setAttribute("goodBehaviorUserList", goodBehaviorUserList);
		session.setAttribute("goodUseUserList", goodUseUserList);
		session.setAttribute("popularParkList", popularParkList);
		
		return "/admin/adminindex.jsp";
	}

}
