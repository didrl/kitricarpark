package com.carpark.admin.report.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.admin.model.PenaltyDto;
import com.carpark.admin.model.service.AdminReportServiceImpl;
import com.carpark.util.NumberCheck;
import com.carpark.util.StringCheck;

public class AdminReportRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String report_id = StringCheck.nullToBlank(request.getParameter("report_id"));
		int penalty_code = NumberCheck.nullToZero(request.getParameter("penalty_code"));
		String penalty_content = StringCheck.nullToBlank(request.getParameter("penalty_content").replace("\r\n", "<br>"));
		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		
		PenaltyDto penaltyDto = new PenaltyDto();
		penaltyDto.setUser_id(report_id);
		penaltyDto.setPenalty_code(penalty_code);
		penaltyDto.setPenalty_content(penalty_content);
		penaltyDto.setSeq(seq);
		System.out.println(seq);
		
		int cnt = AdminReportServiceImpl.getAdminReportService().writeArticle(penaltyDto);
		if(cnt != 0)
			System.out.println("성공?");
		else
			System.out.println("실패");
		
		return "/admin/report/list.jsp";
	}

}
