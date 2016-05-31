package com.carpark.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MemberDto;

public class AdminDaoImpl implements AdminDao {

	private static AdminDao adminDaoImpl;
	
	public static AdminDao getAdminDaoImpl() {
		return adminDaoImpl;
	}

	static{
		adminDaoImpl=  new AdminDaoImpl();
	}
	
	private AdminDaoImpl(){}
	
	@Override
	public ArrayList<MemberDto> allUserInfo() {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		MemberDto memberDto;
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			
			sql += "select user_id, user_name, grade_id, host_flag,coin, user_avgpoint,penalty,user_flag,email,tel\n";
			sql += "from member \n"; 

			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행

			rs=pstmt.executeQuery();

			while(rs.next()){
				memberDto = new MemberDto();
				
				memberDto.setUser_id(rs.getString("user_id"));
				memberDto.setUser_name(rs.getString("user_name"));
				memberDto.setGrade_id(rs.getInt("grade_id"));
				memberDto.setHost_flag(rs.getInt("host_flag"));
				memberDto.setCoin(rs.getInt("coin"));
				memberDto.setUser_avgPoint(rs.getInt("user_avgpoint"));
				memberDto.setPenalty(rs.getInt("penalty"));
				memberDto.setUser_flag(rs.getInt("user_flag"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setTel(rs.getString("tel"));
				
				list.add(memberDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		System.out.println(">>>>>>>><<<<<<<<<<<>>>>>>>>>>><<<<<"+list.size());
		return list;
	}

}
