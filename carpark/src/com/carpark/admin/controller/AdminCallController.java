package com.carpark.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.AdminActionFactory;
import com.carpark.factory.MemberActionFactory;
import com.carpark.util.BoardConstance;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageMove;
import com.carpark.util.StringCheck;

@WebServlet("/admincall")
public class AdminCallController extends HttpServlet {
	private static final long serialVersionUID = 1L;
           
      
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String act = request.getParameter("act");
    		System.out.println("adminCallAct>>>>>>>>>"+act);
    		int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
    		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
    		String key = StringCheck.nullToBlank(request.getParameter("key"));
    		String word = StringCheck.nullToBlank(request.getParameter("word"));
    		String path = "/index.jsp";
    		String queryString = "?bcode=" + bcode + "&pg=" + pg + "&key=" + key + "&word=" + Encoder.isoToUtf(word);
    		
    		if("".equals(act)) {
    			
    		} else if("adminCallWrite".equals(act)) {//쪽지보내기
    			path = MemberActionFactory.getMemberMessageWriteAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);

    		} else if("adminCallSendView".equals(act)) {//보낸쪽지보기
    			path = AdminActionFactory.getAdminCallViewAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("adminCallReceiveView".equals(act)) {//받은쪽지보기
    			path = AdminActionFactory.getAdminCallRegisterAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("adminCallSendDelete".equals(act)) {//보낸쪽지변경
    			path = AdminActionFactory.getAdminCallModifyAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("adminCallReceiveDelete".equals(act)) {//받은쪽지삭제
    			AdminActionFactory.getAdminCallDeleteAction().execute(request, response);
    			path = AdminActionFactory.getAdminCallListAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("adminCallReceiveList".equals(act)) {//받은쪽지목록
    			path = AdminActionFactory.getAdminCallListAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    			
    		} else if("adminCallConfirm".equals(act)) {
    			AdminActionFactory.getAdminCallConfirmAction().execute(request, response);
    			path = AdminActionFactory.getAdminCallListAction().execute(request, response);
    			PageMove.forward(request, response, path + queryString);
    		} else if("".equals(act)) {
    			
    		} else if("".equals(act)) {
    			
    		} else if("".equals(act)) {
    			
    		}
    	}

    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		request.setCharacterEncoding(BoardConstance.DEFAULT_CHARSET);
    		doGet(request, response);
    	}

}
