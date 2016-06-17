package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.common.model.ParkingViewDto;
import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.FavoriteDto;

public class MemberFavoriteDaoImpl implements MemberFavoriteDao {

	private static MemberFavoriteDao memberFavoriteDao;
	
	static {
		memberFavoriteDao = new MemberFavoriteDaoImpl();
	}
	
	private MemberFavoriteDaoImpl(){}

	public static MemberFavoriteDao getMemberFavoriteDao() {
		return memberFavoriteDao;
	}

	@Override
	public void addfavortie(FavoriteDto favoriteDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "insert into favorite(user_id, park_id) \n";//새로 작성하는 글 번호
			sql +="values (?,?)";
			pstmt = conn.prepareStatement(sql);
			int idx=0;
			pstmt.setString(++idx, favoriteDto.getUser_id());
			pstmt.setInt(++idx, favoriteDto.getPark_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}

	@Override
	public void delfavortie(FavoriteDto favoriteDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "delete from favorite \n";//새로 작성하는 글 번호
			sql +="where user_id=? \n";
			sql +="and park_id=?";
			pstmt = conn.prepareStatement(sql);
			int idx=0;
			pstmt.setString(++idx, favoriteDto.getUser_id());
			pstmt.setInt(++idx, favoriteDto.getPark_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}

	@Override
	public List<FavoriteDto> favoritelist(String user_id) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		FavoriteDto favoriteDto;
		ArrayList<FavoriteDto> list = new ArrayList<FavoriteDto>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			
			sql += "select f.user_id, p.park_id, p.park_name, p.owner_id \n";
			sql += "from favorite f, parking p \n"; 
			sql += "where f.park_id = p.park_id \n";
			sql += "and f.user_id = ? \n";

			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setString(idx++, user_id);

			rs=pstmt.executeQuery();

			while(rs.next()){
				favoriteDto = new FavoriteDto();
				
				favoriteDto.setPark_id(rs.getInt("park_id"));
				favoriteDto.setUser_id(rs.getString("user_id"));
				favoriteDto.setPark_name(rs.getString("park_name"));
				favoriteDto.setOwner_id(rs.getString("owner_id"));
				
				list.add(favoriteDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

	@Override
	public ParkingViewDto getParkingView(int park_id) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		ParkingViewDto parkingViewDto = new ParkingViewDto();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			
			sql += "select p.park_name, p.owner_id, p.detail_addr, pd.park_avgpoint, pd.park_flag, pd.fulltime_monthly_pay \n";
			sql += "from parking_detail pd, parking p \n"; 
			sql += "where pd.park_id = p.park_id \n";
			sql += "			and p.park_id = ? \n";

			pstmt = conn.prepareStatement(sql);
			int idx =1;
			pstmt.setInt(idx++, park_id);

			rs=pstmt.executeQuery();

			if(rs.next()){
				parkingViewDto.setPark_name(rs.getString("park_name"));
				parkingViewDto.setAvg_point(rs.getDouble("park_avgpoint"));
				parkingViewDto.setFulltime_monthly_pay(rs.getInt("fulltime_monthly_pay"));
				parkingViewDto.setOwner_id(rs.getString("owner_id"));
				parkingViewDto.setLocation(rs.getString("detail_addr"));
				parkingViewDto.setPark_flag(rs.getInt("park_flag"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return parkingViewDto;
	}
}
