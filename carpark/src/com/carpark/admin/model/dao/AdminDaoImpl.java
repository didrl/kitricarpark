package com.carpark.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.admin.model.StatsChangeUserDto;
import com.carpark.admin.model.StatsGoodBehaviorUsersDto;
import com.carpark.admin.model.StatsGoodUseUserDto;
import com.carpark.admin.model.StatsPopularParkDto;
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

	@Override
	public List<StatsChangeUserDto> changeUserList() {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		StatsChangeUserDto statsChangeUserDto;
		ArrayList<StatsChangeUserDto> list = new ArrayList<StatsChangeUserDto>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			
			sql += "select rownum, a.logtime, a.sumover\n";
			sql += "from(	select logtime,  sum(count(user_id)) over (order by logtime) as sumover \n"; 
			sql += "			from member \n";
			sql += "			group by logtime \n";
			sql += "			order by logtime) a \n";
			sql += "where rownum<16 \n";

			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행

			rs=pstmt.executeQuery();

			while(rs.next()){
				statsChangeUserDto = new StatsChangeUserDto();
				
				statsChangeUserDto.setLogtime(rs.getString("logtime"));
				statsChangeUserDto.setSumover(rs.getInt("sumover"));
				
				list.add(statsChangeUserDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

	@Override
	public List<StatsGoodBehaviorUsersDto> goodBehaviorUserList() {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		StatsGoodBehaviorUsersDto statsGoodBehaviorUsersDto;
		ArrayList<StatsGoodBehaviorUsersDto> list = new ArrayList<StatsGoodBehaviorUsersDto>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql += "select rownum, a.user_id, a.user_avgpoint, a.penalty\n";
			sql += "from (select user_id, user_avgpoint, penalty \n"; 
			sql += "			from member \n";
			sql += "			order by user_avgpoint desc, penalty) a \n";
			sql += "where rownum<11 \n";

			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next()){
				statsGoodBehaviorUsersDto = new StatsGoodBehaviorUsersDto();
				
				statsGoodBehaviorUsersDto.setUser_id(rs.getString("user_id"));
				statsGoodBehaviorUsersDto.setPenalty(rs.getInt("penalty"));
				statsGoodBehaviorUsersDto.setUser_avgpoint(rs.getInt("user_avgpoint"));
				
				list.add(statsGoodBehaviorUsersDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

	@Override
	public List<StatsGoodUseUserDto> goodUseUserList() {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		StatsGoodUseUserDto statsGoodUseUserDto;
		ArrayList<StatsGoodUseUserDto> list = new ArrayList<StatsGoodUseUserDto>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql += "select rownum, a.user_id,a.rcount,a.fcount,a.user_avgpoint\n";
			sql += "from(select distinct m.user_id, m.user_avgpoint,nvl(r.rcount,0) rcount,nvl( f.fcount,0) fcount,nvl((r.rcount+f.fcount),0) point \n"; 
			sql += "			from (select user_id, count(user_id) rcount \n";
			sql += "						from reservation \n";
			sql += "						group by user_id \n";
			sql += "						order by rcount desc) r, \n";
			sql += "						(select user_id, count(user_id) fcount \n";
			sql += "						from favorite \n";
			sql += "						group by user_id \n";
			sql += "						order by fcount desc) f, member m \n";
			sql += "			where r.user_id(+)=m.user_id and \n";
			sql += "						f.user_id (+)= m.user_id \n";
			sql += "			order by  point desc) a \n";
			sql += "where rownum <11 \n";

			pstmt = conn.prepareStatement(sql);

			rs=pstmt.executeQuery();

			while(rs.next()){
				statsGoodUseUserDto = new StatsGoodUseUserDto();
				
				statsGoodUseUserDto.setUser_id(rs.getString("user_id"));
				statsGoodUseUserDto.setFcount(rs.getInt("fcount"));
				statsGoodUseUserDto.setRcount(rs.getInt("rcount"));
				statsGoodUseUserDto.setUser_avgpoint(rs.getDouble("user_avgpoint"));
				
				list.add(statsGoodUseUserDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

	@Override
	public List<StatsPopularParkDto> popularParkList() {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		StatsPopularParkDto statsPopularParkDto;
		ArrayList<StatsPopularParkDto> list = new ArrayList<StatsPopularParkDto>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			
			sql += "select rownum, a.park_id,a.rcount,a.fcount,a.park_name,a.park_avgpoint\n";
			sql += "from( \n";
			sql += "			select distinct pd.park_id, pd.park_avgpoint,nvl(r.rcount,0) rcount,nvl( f.fcount,0) fcount,nvl((r.rcount+f.fcount),0) point,p.park_name \n";
			sql += "			from (select park_id, count(park_id) rcount \n";
			sql += "						from reservation \n";
			sql += " 						group by park_id \n";
			sql += " 						order by rcount desc) r,\n";
			sql += " 					 (select park_id, count(park_id) fcount	\n";
			sql += "						from favorite \n";
			sql += " 						group by park_id\n";
			sql += " 						order by fcount desc) f, parking_detail pd,parking p\n";
			sql += " 			where r.park_id(+)=pd.park_id and\n";
			sql += "						f.park_id (+)= pd.park_id and \n";
			sql += "						pd.park_id = p.park_id \n";
			sql += " order by  point desc) a\n";
			sql += " where rownum <11 \n";
			

			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행

			rs=pstmt.executeQuery();

			while(rs.next()){
				statsPopularParkDto = new StatsPopularParkDto();
				
				statsPopularParkDto.setFcount(rs.getInt("fcount"));
				statsPopularParkDto.setPark_avgpoint(rs.getDouble("park_avgpoint"));
				statsPopularParkDto.setPark_name(rs.getString("park_name"));
				statsPopularParkDto.setRcount(rs.getInt("rcount"));
				
				list.add(statsPopularParkDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

}
