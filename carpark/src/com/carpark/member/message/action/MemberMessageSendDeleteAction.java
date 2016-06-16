package com.carpark.member.message.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberMessageServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.StringCheck;

public class MemberMessageSendDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		String delete_recei = request.getParameter("delete_recei");
		if(delete_recei.equals("0")) {
			MemberMessageServiceImpl.getMemberMessageService().deleteSendUpdate(seq);
		} else {
			MemberMessageServiceImpl.getMemberMessageService().deleteArticle(seq);
		}
		
		return "/message/sendlist.jsp";
	}

}
