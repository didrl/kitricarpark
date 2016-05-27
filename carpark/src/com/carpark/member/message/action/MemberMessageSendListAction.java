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
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		String userId = memberDto.getUser_id();
		List<MessageDto> sendList = MemberMessageServiceImpl.getMemberMessageService().sendListArticle(userId);
		request.setAttribute("sendList", sendList);
		
		return "/message/sendlist.jsp";
	}

}
