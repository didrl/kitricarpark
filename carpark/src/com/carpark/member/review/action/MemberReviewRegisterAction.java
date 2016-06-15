package com.carpark.member.review.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReviewDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberReviewServiceImpl;

public class MemberReviewRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("memberInfo");
		ReviewDto reviewDto = new ReviewDto();
		
		int seq = CommonServiceImpl.getCommonService().getNextSeq();
		String user_id = memberDto.getUser_id();
		
		reviewDto.setSeq(seq);
		reviewDto.setUser_id(user_id);
		reviewDto.setAvaled_id(request.getParameter("avaled_id"));
		reviewDto.setPark_id(Integer.parseInt(request.getParameter("park_id")));
		reviewDto.setHost_flag(Integer.parseInt(request.getParameter("host_flag")));
		reviewDto.setAvgPoint(Double.parseDouble(request.getParameter("avg_point_review")));
		//int bcode = Integer.parseInt(request.getParameter("bcode"));
		reviewDto.setSubject(request.getParameter("subject_review"));
		reviewDto.setContent(request.getParameter("content_review"));
		
		MemberReviewServiceImpl.getMemberReviewService().writeArticle(reviewDto);
		
		ArrayList<ReviewDto> reviewlist = MemberReviewServiceImpl.getMemberReviewService().listReview(request.getParameter("park_id"));
		session.setAttribute("reviewlist", reviewlist);
		
		return "/member?act=mvSearchResultDetail&parkingid="+request.getParameter("park_id");
	}
}
