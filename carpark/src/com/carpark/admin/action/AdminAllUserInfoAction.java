package com.carpark.admin.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminServiceImpl;
import com.carpark.member.model.MemberDto;

public class AdminAllUserInfoAction implements Action {
  
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ArrayList<MemberDto> list = AdminServiceImpl.getAdminService().allUserInfo();
		request.setAttribute("allmemberinfo", list);
		
		return "/admin/customer/info.jsp";
	}

}
