package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.FavoriteDto;
import com.carpark.member.model.MemberCarDto;

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
				favoriteDto.setParkName(rs.getString("park_name"));
				favoriteDto.setOwnerId(rs.getString("owner_id"));
				
				list.add(favoriteDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}
	
	
}
