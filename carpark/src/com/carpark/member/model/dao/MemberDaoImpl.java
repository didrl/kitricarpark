package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carpark.admin.model.ParkingDto;
import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MemberDto;

public class MemberDaoImpl implements MemberDao {
	private static MemberDao memberDao;
	
	private MemberDaoImpl(){}
	
	static{
		memberDao = new MemberDaoImpl();
	}
	
	public static MemberDao getMemberDao() {
		return memberDao;
	}

	@Override
	public int register(MemberDto memberDto) {

		int count=0;
		Connection conn=null;
		PreparedStatement pstmt =null;
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql += "insert into member(user_id,user_pass,carinfo,grade_id) \n";
			sql += "values(?,?,?,3)";//치환변수 
			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행
			int idx =1;//중간에 없어지거나 추가될때 필요
			pstmt.setString(idx++, memberDto.getUser_id());
			pstmt.setString(idx++, memberDto.getUser_pass());
			pstmt.setString(idx++, memberDto.getCarInfo());
			System.out.println("id"+memberDto.getUser_id());
			System.out.println("pass"+memberDto.getUser_pass());
			System.out.println("carinfo"+memberDto.getCarInfo());
			
			count=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt);
		}	
		return count;

	}

	@Override
	public int idcheck(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDto getMember(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modify(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDto login(Map<String, String> map) {
		MemberDto memberDto = null;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql+="select user_id,coin,grade_id \n";
			sql+="from member \n";
			sql+="where user_id=? and user_pass=? \n";
		
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,map.get("userid"));
			pstmt.setString(2,map.get("userpwd"));
			rs=pstmt.executeQuery();
			if(rs.next()){
				//이름,이메일,보유코인 필요
				memberDto =new MemberDto();				
				memberDto.setUser_id(rs.getString("user_id"));
				memberDto.setCoin(rs.getInt("coin"));
				memberDto.setGrade_id(rs.getInt("grade_id"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return memberDto;
	}

	@Override
	public List<ParkingDto> list(Map<String, String> map) {
		
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		Map<String,String> maps =null;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql+="select user_id,coin,grade_id \n";
			sql+="from member \n";
			sql+="where user_id=? and user_pass=? \n";
			int idx=1;
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(idx++,map.get(""));
			pstmt.setString(idx++,map.get(""));
			pstmt.setString(idx++,map.get(""));
			rs=pstmt.executeQuery();
			while(rs.next()){
				maps = new HashMap<String, String>();
						
				memberDto.setUser_id(rs.getString("user_id"));
				memberDto.setCoin(rs.getInt("coin"));
				memberDto.setGrade_id(rs.getInt("grade_id"));
				
				list.add(maps);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		
		return list;
	}
}
