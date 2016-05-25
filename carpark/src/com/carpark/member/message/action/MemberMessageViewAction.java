package com.carpark.member.message.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.service.MemberMessageServiceImpl;
import com.carpark.util.NumberCheck;

public class MemberMessageViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		System.out.println(seq);
		if(seq != 0) {
			MessageDto messageDto = MemberMessageServiceImpl.getMemberMessageService().viewArticle(seq);
			request.setAttribute("messageView", messageDto);
		}
		return "/message/view.jsp";
	}

}
