package com.carpark.member.report.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.member.model.service.MemberReportServiceImpl;
import com.carpark.util.NumberCheck;

public class MemberReportDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		if(seq != 0) {
			MemberReportServiceImpl.getMemberReportService().deleteArticle(seq);
		}
		return "/report/list.jsp";
	}

}
