package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.ReviewDto;

public class MemberReviewDaoImpl implements MemberReviewDao {

	private static MemberReviewDao memberReviewDao;
	
	static {
		memberReviewDao = new MemberReviewDaoImpl();
	}
	
	private MemberReviewDaoImpl(){}

	public static MemberReviewDao getMemberReviewDao() {
		return memberReviewDao;
	}

	@Override
	public ArrayList<ReviewDto> getReview(String park_id) {
		ReviewDto reviewDto = null;
		ArrayList<ReviewDto> list = new ArrayList<ReviewDto>();
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql +="select b.content, b.subject,b.user_id,a.park_id,a.avgpoint, b.logtime \n";
			sql +="from review r, board b, avgpoint a, parking p\n";
			sql +="where r.seq=b.seq\n";
			sql +="			and r.rseq=a.rseq\n";
			sql +="			and a.park_id = p.park_id\n";
			sql +="			and a.park_id =?\n";
		
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,park_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//이름,이메일,보유코인 필요
				reviewDto =new ReviewDto();		
				reviewDto.setContent(rs.getString("content"));
				reviewDto.setUser_id(rs.getString("user_id"));
				reviewDto.setSubject(rs.getString("subject"));
				reviewDto.setLogtime(rs.getString("logtime"));
				reviewDto.setPark_id(rs.getInt("park_id"));
				reviewDto.setAvgPoint(rs.getInt("avgpoint"));
				
				list.add(reviewDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
}
