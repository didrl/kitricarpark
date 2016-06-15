package com.carpark.member.review.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReviewDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberReviewServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberReceiveReviewListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));
		
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		if (memberDto != null) {
			List<ReviewDto> list = MemberReviewServiceImpl.getMemberReviewService().receiveListArticle(memberDto.getUser_id());
//			PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorUser(memberDto.getUser_id(), pg, key,
//					word);
//			navigator.setRoot(request.getContextPath());
//			navigator.setNavigatorSend();
//			request.setAttribute("navigator", navigator);	
			session.setAttribute("receiveReview", list);
				return "/member/receiveReviewList.jsp";
		}else
//			return "";
			return "/member/loginFail.jsp";
	}

}
