package com.carpark.member.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.common.model.CallDto;
import com.carpark.member.model.service.MemberCallServiceImpl;
import com.carpark.member.model.service.MemberMessageServiceImpl;
import com.carpark.util.NumberCheck;

public class MemberCallViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		if(seq != 0) {
			CallDto callDto = MemberCallServiceImpl.getMemberCallService().sendView(seq);
			request.setAttribute("callSendView", callDto);
		}
		return "/member/callSendView.jsp";
	}
}
