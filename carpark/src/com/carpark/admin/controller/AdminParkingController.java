package com.carpark.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.AdminActionFactory;
import com.carpark.util.BoardConstance;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageMove;
import com.carpark.util.StringCheck;

@WebServlet("/adminparking")
public class AdminParkingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String visit = StringCheck.nullToBlank(request.getParameter("visit"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		String flag = request.getParameter("flag");
		
		String path = "/index.jsp";
		String queryString = "?pg=" + pg + "&flag=" + flag +  "&visit=" + visit + "&key=" + key + "&word=" + Encoder.isoToUtf(word);
		
		System.out.println("controller = pg : " + pg + " , flag : " + flag + " , visit : " + visit + " , key : " + key + " , word : " + word);
		
		if("adminParkingSearch".equals(act)) {
			path = AdminActionFactory.getAdminParkingSearchAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("adminParkingRegister".equals(act)) {
			AdminActionFactory.getAdminParkingRegisterAction().execute(request, response);
			path = AdminActionFactory.getAdminParkingListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("adminParkingModify".equals(act)) {
			AdminActionFactory.getAdminParkingModifyAction().execute(request, response);
			path = AdminActionFactory.getAdminParkingListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("adminParkingView".equals(act)) {
			path = AdminActionFactory.getAdminParkingViewAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("adminParkList".equals(act)) {
			path = AdminActionFactory.getAdminParkingListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("parkVisitList".equals(act)) {
			path = AdminActionFactory.getAdminParkingVisitListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
			
		} else if("adminParkingMvModify".equals(act)) {
			AdminActionFactory.getAdminParkingViewAction().execute(request, response);
			path = "/admin/parking/modify.jsp";
			PageMove.forward(request, response, path + queryString);
			
		} else if("adminParkingVisit".equals(act)) {
			AdminActionFactory.getAdminParkingVisitAction().execute(request, response);
			path = AdminActionFactory.getAdminParkingVisitListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
		} else if("adminParkingDelete".equals(act)) {
			path = AdminActionFactory.getAdminParkingDeleteAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(BoardConstance.DEFAULT_CHARSET);
		doGet(request, response);
	}

}
