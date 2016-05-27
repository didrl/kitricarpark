package com.carpark.member.message.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.member.model.service.MemberMessageServiceImpl;
import com.carpark.util.*;

public class MemberMessageDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("word")));
		
		MemberMessageServiceImpl.getMemberMessageService().deleteArticle(seq);
				
		return "";
	}

}
