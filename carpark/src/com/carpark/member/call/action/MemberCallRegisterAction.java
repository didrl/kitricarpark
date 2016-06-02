package com.carpark.member.call.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.action.Action;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.member.model.service.MemberCallServiceImpl;
import com.carpark.util.Encoder;

public class MemberCallRegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int seq = CommonServiceImpl.getCommonService().getNextSeq();
		return null;
	}

}
