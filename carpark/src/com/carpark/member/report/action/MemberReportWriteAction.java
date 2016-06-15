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
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class MemberReportWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		if(memberDto != null) {
		
			int seq = CommonServiceImpl.getCommonService().getNextSeq();
			
			String userId = memberDto.getUser_id();
			int bcode = 3;//페이지 처리를 위한 bcode
			int pg = NumberCheck.nullToOne(request.getParameter("pg"));
			String key = StringCheck.nullToBlank(request.getParameter("key"));
			String word = StringCheck.nullToBlank(request.getParameter("word"));
			
			ReportDto reportDto = new ReportDto();
			reportDto.setSeq(seq);
			reportDto.setUserID(memberDto.getUser_id());
			reportDto.setBcode(bcode);
			reportDto.setSubject(request.getParameter("subject"));
			reportDto.setContent(request.getParameter("content").replace("\r\n", "<br>"));
	
			reportDto.setPark_id(Integer.parseInt(request.getParameter("park_id")));
			reportDto.setReport_id(request.getParameter("report_id"));
			
			int cnt = MemberReportServiceImpl.getMemberReportService().writeArticle(reportDto);
			System.out.println("cnt : " + cnt);
			if(cnt != 0) {
				List<ReportDto> list = MemberReportServiceImpl.getMemberReportService().listArticle(userId, pg, key, word);
				request.setAttribute("reportList", list);
				
				//페이지
				PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigator(userId, bcode, pg, key, word);
				navigator.setRoot(request.getContextPath());
				navigator.setNavigator("reportList");
				request.setAttribute("navigator", navigator);
			} else {
				System.out.println("입력 실패");
			}
			return "/search/searchResultDetail.jsp";
		} else {
//			return "index.jsp";
			return "/member/loginFail.jsp";
		}

	}

}
