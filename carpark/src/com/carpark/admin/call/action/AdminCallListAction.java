package com.carpark.admin.call.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.CallDto;
import com.carpark.admin.model.service.AdminCallServiceImpl;
import com.carpark.member.model.MemberDto;


public class AdminCallListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		String receiveId = memberDto.getUser_id();
		
		if(receiveId != null) {
			List<CallDto> receiveList = AdminCallServiceImpl.getAdminCallService().receiveListArticle(receiveId);
			request.setAttribute("receiveList", receiveList);
		}
		return "/admin/parklist/getInform.jsp";
	}

}
