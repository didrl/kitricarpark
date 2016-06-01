package com.carpark.member.model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.MessageDto;

public class MemberCoinDaoImpl implements MemberCoinDao{

	private static MemberCoinDao memberCoinDao;
	
	static {
		memberCoinDao = new MemberCoinDaoImpl();
	}
	
	private MemberCoinDaoImpl(){}

	public static MemberCoinDao getMemberCoinDao() {
		return memberCoinDao;
	}
	
	@Override
	public int getMyCoin(String user_id) {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int coin = 0;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select coin \n";
			sql += "from member\n";
			sql += "where user_id = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				MemberDto memberDto = new MemberDto();
				memberDto.setCoin(rs.getInt("coin"));
				coin = memberDto.getCoin();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}	
			return coin;
		}
}
