package com.carpark.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.MemberActionFactory;
import com.carpark.util.PageMove;

@WebServlet("/reservation")
public class MemberReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		System.out.println("act>>>>>>>>>>>>>"+act);
		String path ="/index.jsp";
		
		if("mvReservation".equals(act)){
			path = MemberActionFactory.getMemberReservationMoveAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("payok".equals(act)){
			path = MemberActionFactory.getMemberReservationRegisterAction().execute(request, response);
			PageMove.redirect(response, root + path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
