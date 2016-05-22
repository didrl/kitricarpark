package com.carpark.member.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.MemberActionFactory;
import com.carpark.util.PageMove;

@WebServlet("/member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		System.out.println("act>>>>>>>>>>>>>"+act);
		String path ="/index.jsp";
		
		if("mvlogin".equals(act)){
			path = MemberActionFactory.getMemberLoginAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("mvSearchResult".equals(act)){
			// go to carpark/search/searchResult.jsp with location, fromDate, endDate
		}else if("mvReservation".equals(act)){
			// go to carpark/reservation/reservationDetail.jsp with park_id, fromDate, endDate
		}else if("mvSearchResultDetail".equals(act)){
			// go to carpark/search/searchResultDetail.jsp with parkingDto, fromDate, endDate
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
