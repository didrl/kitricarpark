package com.carpark.admin.report.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminReportServiceImpl;
import com.carpark.member.model.ReportDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class AdminReportListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int bcode = 3;//페이지처리용
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(Encoder.isoToUtf(request.getParameter("word")));
		
		List<ReportDto> list = AdminReportServiceImpl.getAdminReportService().listArticle(pg, key, word);
		
		request.setAttribute("adminReportList", list);
		
		PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorAdminReport(bcode, pg, key, word);
		navigator.setRoot(request.getContextPath());
		navigator.setNavigator("adminReportList");
		request.setAttribute("navigator", navigator);
		
		return "/admin/report/list.jsp";
	}

}
