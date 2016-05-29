package com.carpark.member.model.dao;

import java.sql.*;
import java.util.Map;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;

public class CommonDaoImpl implements CommonDao {
	
	private static CommonDao commonDao;
	
	static {
		commonDao = new CommonDaoImpl();
	}
	
	private CommonDaoImpl(){}
	
	public static CommonDao getCommonDao() {
		return commonDao;
	}

	@Override
	public int getNextSeq() {
		int seq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "select board_seq.nextval from dual";//새로 작성하는 글 번호
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			seq = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return seq;
	}

	@Override
	public void updateHit(int seq) {
		// TODO Auto-generated method stub

	}

	@Override
	public int newArticleCount(int bcode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int totalArticleCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getNextParkingId() {
		int parkingId = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "select call_num_pcseq.nextval from dual";//주차장 아이디
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			parkingId = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return parkingId;
	}

}
