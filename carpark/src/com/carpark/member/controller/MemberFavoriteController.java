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
import com.carpark.util.PageMove;

@WebServlet("/favorite")
public class MemberFavoriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String root = request.getContextPath();
		String search = Encoder.utfUrl(request.getParameter("search"));
		String act = Encoder.utfUrl(request.getParameter("act"));
		System.out.println("act>>>>>>>>>>>>>"+act);
		String path ="/index.jsp";
		
		if("delfavorite".equals(act)){
			path = MemberActionFactory.getMemberFavoriteDeleteAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("addfavorite".equals(act)){
			path = MemberActionFactory.getMemberFavoriteRegisterAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("favoritelist".equals(act)){
			path = MemberActionFactory.getMemberFavoriteListAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("favoriteParkView".equals(act)){
			path = MemberActionFactory.getMemberFavoriteViewAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else {
			PageMove.redirect(response, root + path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(BoardConstance.DEFAULT_CHARSET);
		doGet(request, response);
	}

}
