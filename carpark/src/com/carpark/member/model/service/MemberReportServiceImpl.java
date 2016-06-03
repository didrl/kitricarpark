package com.carpark.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carpark.member.model.ReportDto;
import com.carpark.member.model.dao.MemberMessageDaoImpl;
import com.carpark.member.model.dao.MemberReportDaoImpl;
import com.carpark.util.BoardConstance;

public class MemberReportServiceImpl implements MemberReportService {

	private static MemberReportService memberReportService;
	
	static {
		memberReportService = new MemberReportServiceImpl();
	}
	
	private MemberReportServiceImpl(){}

	public static MemberReportService getMemberReportService() {
		return memberReportService;
	}

	@Override
	public int writeArticle(ReportDto reportDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReportDto viewArticle(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReportDto> listArticle(String userId, int pg, String key, String word) {
		Map<String, String> map = new HashMap<String, String>();
		
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		
		map.put("userId", userId);
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("key", key);
		map.put("word", word);
		
		return MemberReportDaoImpl.getMemberReportDao().listArticle(map);
	}
	
	
}
