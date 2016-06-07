package com.carpark.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.MemberActionFactory;
import com.carpark.util.BoardConstance;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageMove;
import com.carpark.util.StringCheck;

@WebServlet("/memberparking")
public class MemberParkingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		String parkAddress = Encoder.isoToUtf(StringCheck.nullToBlank(request.getParameter("parkAddress")));
		
		String path = "/index.jsp";
		String queryString = "?bcode=" + bcode + "&pg=" + pg + "&key=" + key + "&word=" + Encoder.isoToUtf(word);
		
		if("parkingRegister".equals(act)) {
			path = MemberActionFactory.getMemberParkingRegisterAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("parkingSearch".equals(act)) {
			path = MemberActionFactory.getMemberParkingSearchAction().execute(request, response);
			PageMove.forward(request, response, path + "?pg=" + pg);
			
		} else if("parkingList".equals(act)) {
			path = MemberActionFactory.getMemberParkingListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("parkingModify".equals(act)) {
			path = MemberActionFactory.getMemberParkingModifyAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("parkingDelete".equals(act)) {
			MemberActionFactory.getMemberParkingDeleteAction().execute(request, response);
			path = MemberActionFactory.getMemberParkingListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("parkingView".equals(act)) {
			path = MemberActionFactory.getMemberParkingViewAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			 
		} else if("parkingMvModify".equals(act)) {
			MemberActionFactory.getMemberParkingViewAction().execute(request, response);
			path = "/parking/modify.jsp";
			PageMove.forward(request, response, path + queryString);
			
		} else if("".equals(act)) {
			
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(BoardConstance.DEFAULT_CHARSET);
		doGet(request, response);
	}

}
