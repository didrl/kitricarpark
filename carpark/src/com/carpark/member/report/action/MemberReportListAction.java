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
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberReportListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		
		String userId = memberDto.getUser_id();
		if(userId != null) {
			List<ReportDto> list = MemberReportServiceImpl.getMemberReportService().listArticle(userId, pg, key, word);
			PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorUser(userId, pg, key, word);
			navigator.setRoot(request.getContextPath());
			navigator.setNavigatorSend();
			
			request.setAttribute("reportList", list);
			request.setAttribute("navigator", navigator);
		}
		
		return "/report/list.jsp";
	}

}
