package com.carpark.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.carpark.factory.MemberActionFactory;
import com.carpark.util.BoardConstance;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageMove;
import com.carpark.util.StringCheck;

@WebServlet("/call")
public class MemberCallController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = Encoder.utfUrl(request.getParameter("act"));
		System.out.println("act>>>>>>>>>>>>>"+act);
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		String queryString = "?&pg=" + pg + "&key=" + key + "&word=" + Encoder.isoToUtf(word);
		String path ="/index.jsp";
		
		if("addrSearch".equals(act)){
			path = MemberActionFactory.getMemberCallAddrSearchAction().execute(request, response);
		}else if("mvzip".equals(act)){
			path = MemberActionFactory.getMemberCallMvZipAction().execute(request, response);
			PageMove.redirect(response, root+path);
		}else if("memberParkRegisterMessage".equals(act)){
			path = MemberActionFactory.getMemberCallRegisterAction().execute(request, response);
			PageMove.forward(request, response, path+queryString);
		}else if("callSendList".equals(act)){
			path = MemberActionFactory.getMemberCallListAction().execute(request, response);
			PageMove.forward(request, response, path+queryString);
		}else if("callSendView".equals(act)){
			path = MemberActionFactory.getMemberCallViewAction().execute(request, response);
			PageMove.forward(request, response, path+queryString);
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(BoardConstance.DEFAULT_CHARSET);
		doGet(request, response);
	}

}
