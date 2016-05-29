package com.carpark.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.admin.model.CallDto;
import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;

public class AdminCallDaoImpl implements AdminCallDao {
	private static AdminCallDao adminCallDao;
	
	private AdminCallDaoImpl(){
		
	}

	static{
		adminCallDao = new AdminCallDaoImpl();
	}
	
	public static AdminCallDao getAdminCallDao() {
		return adminCallDao;
	}
	
	@Override
	public CallDto viewArticle(int seq) {
		return null;
	}

	@Override
	public List<CallDto> receiveListArticle(String receiveId) {
		List<CallDto> list = new ArrayList<CallDto>();
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql="";
			sql += "select b.seq, bcode, user_id, subject, contents, \n";
			sql += "		decode(to_char(logtime, 'yymmdd'), \n";
			sql += "				to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n";
			sql += "				to_char(b.logtime, 'yy.mm.dd')) logtime, \n";
			sql += "pcseq, pcall_flag \n";
			sql += "from board b, call c \n";
			sql += "where b.seq = c.pcall_id \n";
			sql += "and user_id= 'IUGuest' \n";
			sql += "order by logtime desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiveId);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CallDto callDto = new CallDto();
				callDto.setSeq(rs.getInt("seq"));
				callDto.setBcode(rs.getInt("bcode"));
				callDto.setUserID(rs.getString("user_id"));
				callDto.setSubject(rs.getString("subject"));
				callDto.setContent(rs.getString("contents"));
				callDto.setLogtime(rs.getString("logtime"));
				list.add(callDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public void deleteArticle(int seq) {
		// TODO Auto-generated method stub
		
	}

}
