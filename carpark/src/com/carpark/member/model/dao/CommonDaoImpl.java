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
	public int newArticleCount(String userId, int bcode) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(seq) \n";
			sql += "from board \n";
			sql += "where to_char(logtime, 'yymmdd') = to_char(sysdate, 'yymmdd') \n";
			sql += "and bcode = ? \n";
			sql += "and user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bcode);
			pstmt.setString(2, userId);
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
	public int totalArticleCount(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = map.get("id");
		String bcode = map.get("bcode");
		String key = map.get("key");
		String word = map.get("word");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(seq) \n";
				sql += "from board \n";
				sql += "where bcode = ? \n";
				sql += "and user_id = ? \n";
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("subject".equals(key))
						sql += "and subject like '%'||?||'%' \n";
					else
						sql += "and " + key + " = ? \n";						
				}
			}
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, bcode);
			pstmt.setString(++idx, id);
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, word);
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
	public int totalArticleCountAddress(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String address = map.get("address");

		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(street) \n";
				sql += "from zipcode \n";
				sql += "where street like '%'||?||'%' \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address);
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
	public int totalArticleCountParking(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String ownerId = map.get("ownerId");
		String key = map.get("key");
		String word = map.get("word");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(park_id) \n";
				sql += "from parking \n";
				sql += "where owner_id = ? \n";
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("park_name".equals(key))
						sql += "and park_name like '%'||?||'%' \n";
					else
						sql += "and " + key + " = ? \n";						
				}
			}
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, ownerId);
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, word);
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
	public int totalArticleCountAdminParking(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		String visit = map.get("visit");
		String flag = map.get("flag");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(b.park_id) \n";
			sql += "from parking b, parking_detail d \n";
			sql += "where b.park_id = d.park_id \n";
			sql += "and d.park_visit = ? \n";
			if(flag != null && !flag.isEmpty()) {
				sql += "and park_public = ? \n";	
			}
			if(key != null && !key.isEmpty()) {
			    if(word != null && !word.isEmpty()) {
			    	sql += "and " + key + " = ? \n";						
			    }
			}
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, visit);
			if(flag != null && !flag.isEmpty()) {
				pstmt.setString(++idx, flag);
			}
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, word);
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
	public int totalArticleCountAdminReport(Map<String, String> map) {
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
			sql += "where bcode = ? \n";
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("subject".equals(key))
						sql += "and subject like '%'||?||'%' \n";
					else
						sql += "and " + key + " = ? \n";						
				}
			}
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, map.get("bcode"));
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, word);
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
	public int totalArticleCountAdminReportFlag(Map<String, String> map) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		String flag = map.get("flag");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select count(b.seq) \n";
			sql += "from board b, report r \n";
			sql += "where b.bcode = ? \n";
			sql += "and report_flag = ? \n";
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("subject".equals(key))
						sql += "and subject like '%'||?||'%' \n";
					else
						sql += "and " + key + " = ? \n";						
				}
			}
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, map.get("bcode"));
			pstmt.setString(++idx, flag);
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, word);
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
	
	
/////////////////////////// 메소드 통합중 ////////////////////////////////////	
	
	
	

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
	public int newArticleCountUser(String userId, int bcode) {
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
			sql += "and bcode = ? \n";
			sql += "and to_char(logtime, 'yymmdd') = to_char(sysdate, 'yymmdd') \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, bcode);
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
			sql += "and bcode = ? \n";
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
			pstmt.setString(2, map.get("bcode"));
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(3, word);
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
	
////////////////////////////////////////////////////////////////////////////	

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
