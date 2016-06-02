package com.carpark.member.message.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberMessageServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberMessageSendListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		if (memberDto != null) {
			String userId = memberDto.getUser_id();
			if (userId != null) {
				List<MessageDto> sendList = MemberMessageServiceImpl.getMemberMessageService().sendListArticle(userId,
						pg, key, word);
				PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorUser(userId, pg, key,
						word);
				navigator.setRoot(request.getContextPath());
				navigator.setNavigatorSend();
				request.setAttribute("sendList", sendList);
				request.setAttribute("navigator", navigator);
			}
			return "/message/sendlist.jsp";
		} else
			return "";
	}

}
