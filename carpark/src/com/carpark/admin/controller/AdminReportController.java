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

@WebServlet("/adminreport")
public class AdminReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String act = request.getParameter("act");
		int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		
		String path = "/index.jsp";
		String queryString = "?bcode=" + bcode + "&pg=" + pg + "&key=" + key + "&word=" + Encoder.isoToUtf(word);
		
		if("".equals(act)) {
			
		} else if("adminReportList".equals(act)) {
			path = AdminActionFactory.getAdminReportListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);

		} else if("adminReportView".equals(act)) {
			path = AdminActionFactory.getAdminReportViewAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);

		} else if("adminReportSearch".equals(act)) {
			path = AdminActionFactory.getAdminReportListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);

		} else if("adminReportDelete".equals(act)) {
			AdminActionFactory.getAdminReportDeleteAction().execute(request, response);
			path = AdminActionFactory.getAdminReportListAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);

		} else if("adminReportListFlag".equals(act)) {
			path = AdminActionFactory.getAdminReportListFlagAction().execute(request, response);
			PageMove.forward(request, response, path + queryString);

		} else if("".equals(act)) {

		} else if("".equals(act)) {

		} 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(BoardConstance.DEFAULT_CHARSET);
		doGet(request, response);
	}

}
