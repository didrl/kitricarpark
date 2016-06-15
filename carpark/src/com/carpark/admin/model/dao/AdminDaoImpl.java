package com.carpark.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return list;
	}

	@Override
	public List<Map<String,String>> changeUserList() {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Map<String,String> map;
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			
			sql += "select rownum, to_char(a.logtime,'yyyy-mm-dd') as logtime, a.sumover\n";
			sql += "from(	select logtime,  sum(count(user_id)) over (order by logtime) as sumover \n"; 
			sql += "			from member \n";
			sql += "			group by logtime \n";
			sql += "			order by logtime) a \n";
			sql += "where rownum<16 \n";

			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행

			rs=pstmt.executeQuery();

			while(rs.next()){
				map = new HashMap<String,String>();
				
				map.put("logtime",rs.getString("logtime"));
				map.put("sumover",rs.getString("sumover"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

	@Override
	public List<Map<String,String>> goodBehaviorUserList() {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Map<String,String> map;
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		try {
			conn=DBConnection.makeConnection();
			String sql="";

			sql += "select rownum, a.user_id, a.user_avgpoint, a.penalty\n";
			sql += "from (select user_id, user_avgpoint, penalty \n"; 
			sql += "			from member \n";
			sql += "			order by user_avgpoint desc, penalty asc) a \n";
			sql += "where rownum<11 \n";

			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next()){
				map = new HashMap<String,String>();
				
				map.put("user_id",rs.getString("user_id"));
				map.put("penalty",rs.getString("penalty"));
				map.put("user_avgpoint",rs.getString("user_avgpoint"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

	@Override
	public List<Map<String,String>> goodUseUserList() {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Map<String,String> map;
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
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
			sql += "			order by  point desc, user_avgpoint desc) a \n";
			sql += "where rownum <11 \n";

			pstmt = conn.prepareStatement(sql);

			rs=pstmt.executeQuery();

			while(rs.next()){
				map = new HashMap<String,String>();
				
				map.put("user_id",rs.getString("user_id"));
				map.put("fcount",rs.getString("fcount"));
				map.put("rcount",rs.getString("rcount"));
				map.put("user_avgpoint",rs.getString("user_avgpoint"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

	@Override
	public List<Map<String,String>> popularParkList() {
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Map<String,String> map;
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
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
			sql += " order by  point desc, park_avgpoint desc) a\n";
			sql += " where rownum <11 \n";
			

			pstmt = conn.prepareStatement(sql);//미리 sql 문장을 가져가서 검사하고 틀린게 없을 때 실행

			rs=pstmt.executeQuery();

			while(rs.next()){
				map = new HashMap<String,String>();
				
				map.put("fcount",rs.getString("fcount"));
				map.put("park_avgpoint",rs.getString("park_avgpoint"));
				map.put("park_name",rs.getString("park_name"));
				map.put("rcount",rs.getString("rcount"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}	
		return list;
	}

}
