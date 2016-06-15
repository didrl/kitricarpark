package com.carpark.member.message.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.carpark.action.Action;
import com.carpark.factory.MemberActionFactory;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberMessageServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberMessageReceiveListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));

		HttpSession session = request.getSession();
//		HttpSession receiveSession = request.getSession();
		
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		
		
		if (memberDto != null) {

			String receiveId = memberDto.getUser_id();
			if (receiveId != null) {
				List<MessageDto> receiveList = MemberMessageServiceImpl.getMemberMessageService()
						.receiveListArticle(receiveId, pg, key, word);
				PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorReceiver(receiveId, pg,
						key, word);
				navigator.setRoot(request.getContextPath());
				navigator.setNavigatorReceive();

				request.setAttribute("receiveList", receiveList);
				request.setAttribute("navigator", navigator);
//				receiveSession.setAttribute("receiveList",receiveList);
			}
	
			return "/message/receivelist.jsp";
		} else
			return "/member/loginFail.jsp";
	}

}
