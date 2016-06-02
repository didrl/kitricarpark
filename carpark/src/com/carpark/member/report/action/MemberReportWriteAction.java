package com.carpark.member.report.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReportDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberReportServiceImpl;

public class MemberReportWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		int seq = CommonServiceImpl.getCommonService().getNextSeq();
		
		ReportDto reportDto = new ReportDto();
		reportDto.setSeq(seq);
		reportDto.setUserID(memberDto.getUser_id());
		reportDto.setSubject(request.getParameter("subject"));
		reportDto.setContent(request.getParameter("content").replace("\r\n", "<br>"));

		reportDto.setPark_id(Integer.parseInt(request.getParameter("park_id")));
		reportDto.setReport_id(request.getParameter("report_id"));

		
		String userId = memberDto.getUser_id();
		int pg = 1;
		String key = "";
		String word = "";
		
		MemberReportServiceImpl.getMemberReportService().writeArticle(reportDto);
		List<ReportDto> list = MemberReportServiceImpl.getMemberReportService().listArticle(userId, pg, key, word);
		request.setAttribute("reportList", list);
		
		
		return "/report/list.jsp";

	}

}
