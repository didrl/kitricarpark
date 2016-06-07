package com.carpark.admin.report.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminReportServiceImpl;
import com.carpark.member.model.ReportDto;
import com.carpark.util.NumberCheck;

public class AdminReportViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		String userId = request.getParameter("reportId");
		if(seq != 0) {
			ReportDto reportDto = AdminReportServiceImpl.getAdminReportService().viewArticle(seq);
			request.setAttribute("reportView", reportDto);
			
			int penalty = AdminReportServiceImpl.getAdminReportService().penaltyPoint(userId);
			
			request.setAttribute("penalty", penalty);
			
		}
		return "/admin/report/view.jsp";
	}

}
