package com.carpark.admin.report.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.MemberReportServiceImpl;
import com.carpark.util.NumberCheck;

public class AdminReportDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		if (memberDto != null) {
			int seq = NumberCheck.nullToZero(request.getParameter("seq"));
			if (seq != 0) {
				MemberReportServiceImpl.getMemberReportService().deleteArticle(seq);
			}
			return "/admin/report/list.jsp";
		} else
			return "/member/loginFail.jsp";
	}

}
