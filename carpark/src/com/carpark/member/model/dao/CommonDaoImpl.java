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
	public int newArticleCountReceiver(String receiveId) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(b.seq) \n";
			sql += "from board b, message m \n";
			sql += "where b.seq = m.seq \n";
			sql += "and receiver_id = ? \n";
			sql += "and to_char(logtime, 'yymmdd') = to_char(sysdate, 'yymmdd') \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiveId);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return count;
	}

	@Override
	public int totalArticleCountReceiver(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(b.seq) \n";
			sql += "from board b, message m \n";
			sql += "where b.seq = m.seq \n";
			sql += "and receiver_id = ? \n";
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("subject".equals(key))
						sql += "and subject like '%'||?||'%' \n";
					else
						sql += "and " + key + " = ? \n";						
				}
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("receiveId"));
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(2, word);
				}
			}
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return count;
	}
	
	@Override
	public int newArticleCountUser(String userId) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(seq) \n";
			sql += "from board \n";
			sql += "where user_id = ? \n";
			sql += "and to_char(logtime, 'yymmdd') = to_char(sysdate, 'yymmdd') \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return count;
	}

	@Override
	public int totalArticleCountUser(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(seq) \n";
			sql += "from board \n";
			sql += "where user_id = ? \n";
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("subject".equals(key))
						sql += "and subject like '%'||?||'%' \n";
					else
						sql += "and " + key + " = ? \n";						
				}
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("userId"));
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(2, word);
				}
			}
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return count;
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
