package com.carpark.member.model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.*;

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

	@Override
	public int chargeCoin(CoinDto coindto,int coin) {
			int cid = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			
			try {
				conn = DBConnection.makeConnection();
				conn.setAutoCommit(false);
				String sql1 = "";
				String sql2 = "";
				
				sql1 += "insert \n";
				sql1 += "into coin (user_id,coin,cid,cflag,cdate) \n";
				sql1 += "values (?, ?, coin_num_seq.nextval,2,sysdate) \n";
				pstmt = conn.prepareStatement(sql1);
				int idx = 0;
				pstmt.setString(++idx, coindto.getUser_id());
				pstmt.setInt(++idx, coindto.getCoin());
				pstmt.executeUpdate();
				//conn.commit();
				
				pstmt.close();
			
				sql2 += "update member \n";
				sql2 += "set coin = ? \n";
				sql2 += "where user_id=?";
				pstmt = conn.prepareStatement(sql2);
				idx = 0;
				pstmt.setInt(++idx, coin);
				pstmt.setString(++idx, coindto.getUser_id());
				pstmt.executeUpdate();
				
				conn.commit();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn, pstmt);
			}
		return cid;
	}

	@Override
	public List<CoinDto> coinList(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}
}
