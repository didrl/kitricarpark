package com.carpark.member.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReviewDto;
import com.carpark.member.model.service.MemberReviewServiceImpl;
import com.carpark.util.NumberCheck;

public class MemberReviewReceiveViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		
		if(memberDto !=null){
			if(seq != 0) {
				ReviewDto reviewDto = MemberReviewServiceImpl.getMemberReviewService().viewArticle(seq);
				request.setAttribute("reviewView", reviewDto);
			}
			return "/member/receiveReviewView.jsp";
		}else
//			return "";
			return "/member/loginFail.jsp";
	}

}
