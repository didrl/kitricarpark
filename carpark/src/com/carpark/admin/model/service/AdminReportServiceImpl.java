package com.carpark.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carpark.admin.model.dao.AdminReportDaoImpl;
import com.carpark.member.model.ReportDto;
import com.carpark.member.model.dao.MemberMessageDaoImpl;
import com.carpark.member.model.dao.MemberReportDaoImpl;
import com.carpark.util.BoardConstance;

public class AdminReportServiceImpl implements AdminReportService {

	private static AdminReportService adminReportService;
	
	static {
		adminReportService = new AdminReportServiceImpl();
	}
	
	private AdminReportServiceImpl(){}

	public static AdminReportService getAdminReportService() {
		return adminReportService;
	}

	@Override
	public int writeArticle(ReportDto reportDto) {
		return MemberReportDaoImpl.getMemberReportDao().writeArticle(reportDto);
	}

	@Override
	public ReportDto viewArticle(int seq) {
		return MemberReportDaoImpl.getMemberReportDao().viewArticle(seq);
	}

	@Override
	public List<ReportDto> listArticle(int pg, String key, String word) {
		Map<String, String> map = new HashMap<String, String>();
		
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("key", key);
		map.put("word", word);
		
		return AdminReportDaoImpl.getAdminReportDao().listArticle(map);
	}

	@Override
	public void modifyArticle(int seq) {
		MemberReportDaoImpl.getMemberReportDao().deleteArticle(seq);
	}

	@Override
	public List<ReportDto> listFlagArticle(String flag, int pg, String key, String word) {
		Map<String, String> map = new HashMap<String, String>();
		
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("flag", flag);
		map.put("key", key);
		map.put("word", word);
		
		return AdminReportDaoImpl.getAdminReportDao().listFlagArticle(map);
	}
	
	
}
