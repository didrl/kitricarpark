package com.carpark.admin.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminCallServiceImpl;
import com.carpark.common.model.CallDto;
import com.carpark.member.model.MemberDto;

public class AdminCallRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int seq = Integer.parseInt(request.getParameter("seq"));
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		if (memberDto != null) {
			CallDto callDto = AdminCallServiceImpl.getAdminCallService().viewArticle(seq);
			request.setAttribute("adminCallReceiveView", callDto);
			return "/admin/call/adminCallReceiveView.jsp";
		} else
			return "";
	}

}
