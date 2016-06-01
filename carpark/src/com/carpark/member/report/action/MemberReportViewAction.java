package com.carpark.member.report.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.service.MemberMessageServiceImpl;
import com.carpark.util.NumberCheck;

public class MemberReportViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		if(seq != 0) {
			ReportDto reportDto = MemberReportServiceImpl.getMemberReportService().viewArticle(seq);
			request.setAttribute("reportView", reportDto);
		}
		return "/report/view.jsp";
	}

}
