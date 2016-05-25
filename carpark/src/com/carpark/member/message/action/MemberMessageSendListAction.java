package com.carpark.member.message.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.service.MemberMessageServiceImpl;

public class MemberMessageSendListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		String userId = "kangnam17";
		List<MessageDto> sendList = MemberMessageServiceImpl.getMemberMessageService().sendListArticle(userId);
		request.setAttribute("messageList", sendList);
		
		return "/message/list.jsp";
	}

}
