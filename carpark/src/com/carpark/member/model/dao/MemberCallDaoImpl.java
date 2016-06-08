package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.common.model.CallDto;
import com.carpark.common.model.ZipDto;
import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;

public class MemberCallDaoImpl implements MemberCallDao {

	private static MemberCallDao memberCallDao;
	
	static {
		memberCallDao = new MemberCallDaoImpl();
	}
	
	private MemberCallDaoImpl(){}

	public static MemberCallDao getMemberCallDao() {
		return memberCallDao;
	}

	@Override
	public List<ZipDto> zipSearchList(String dong) {
		List<ZipDto> list =new ArrayList<ZipDto>();
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {
			conn=DBConnection.makeConnection();
			String sql="";
			sql+="select substr(zipcode,1,instr(zipcode,'-')-1)zip1, \n";
			sql+="substr(zipcode,instr(zipcode,'-')+1)zip2, \n";
			sql+="sido,gugun,dong,nvl(bunji,' ') bunji \n"; 
			sql+="from zipcode \n";
			sql+="where dong like '%'||?||'%' \n";
			
			//자바의 "%"+dong+"%" 와 비슷
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,dong);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ZipDto zipDto =new ZipDto();
				zipDto.setZip1(rs.getString("zip1"));
				zipDto.setZip2(rs.getString("zip2"));
				zipDto.setSido(rs.getString("sido"));
				zipDto.setGugun(rs.getString("gugun"));
				zipDto.setDong(rs.getString("dong"));
				zipDto.setBunji(rs.getString("bunji"));
				
				list.add(zipDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	@Override
	public int register(CallDto callDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql+= "insert all \n";
			sql += "into board (seq, user_id, subject, contents, bcode, logtime) \n";
			sql += "values (?, ?, ?, ?, ?, sysdate) \n";
			sql+= "into call(pcseq,pcall_id,pcall_addr,pcall_flag) \n";
			sql+= "values(call_num_pcseq.nextval,?,?,?) \n";
			sql+= "select * from dual";
			pstmt = conn.prepareStatement(sql);
			int idx=1;
		
			pstmt.setInt(idx++, callDto.getSeq());
			pstmt.setString(idx++, callDto.getUserID());
			pstmt.setString(idx++, callDto.getSubject());
			pstmt.setString(idx++, callDto.getContent());
			pstmt.setInt(idx++, callDto.getBcode());
						
			pstmt.setInt(idx++, callDto.getSeq());
			pstmt.setString(idx++, callDto.getpCall_ADDR());
			pstmt.setInt(idx++, callDto.getpCall_Flag());
			count = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return count;
	}
	
	@Override
	public List<CallDto> sendList(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CallDto callDto = null;
		List<CallDto>list = new ArrayList<CallDto>();
		try {
			
			conn = DBConnection.makeConnection();
			String sql = "";
			sql+= "select b.seq, b.user_id,b.subject,b.logtime,b.contents,c.pcall_flag \n";
			sql+= "from board b, call c \n";
			sql+= "where b.seq = c.pcall_id \n";
			sql+= "and b.user_id = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				callDto = new CallDto();
				callDto.setSeq(rs.getInt("seq"));
				callDto.setUserID(rs.getString("user_id"));
				callDto.setSubject(rs.getString("subject"));
				callDto.setContent(rs.getString("contents"));
				callDto.setLogtime(rs.getString("logtime"));
				callDto.setpCall_Flag(rs.getInt("pcall_flag"));
				list.add(callDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public CallDto sendView(int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CallDto callDto = null;
	try {		
			conn = DBConnection.makeConnection();
			String sql = "";
			sql+= "select b.seq, b.user_id,b.subject,b.logtime,b.contents,c.pcall_flag \n";
			sql+= "from board b, call c \n";
			sql+= "where b.seq = c.pcall_id \n";
			sql+= "and b.seq = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			while(rs.next()){
				callDto = new CallDto();
				callDto.setSeq(rs.getInt("seq"));
				callDto.setUserID(rs.getString("user_id"));
				callDto.setSubject(rs.getString("subject"));
				callDto.setContent(rs.getString("contents"));
				callDto.setLogtime(rs.getString("logtime"));
				callDto.setpCall_Flag(rs.getInt("pcall_flag"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return callDto;
	}

	@Override
	public int modify(CallDto callDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql+="update board \n";
			sql+="set subject=?,contents=? \n";
			sql+="where seq=? \n";			
			pstmt = conn.prepareStatement(sql);
			
			int idx=1;
			pstmt.setString(idx++, callDto.getSubject());
			pstmt.setString(idx++, callDto.getContent());
			pstmt.setInt(idx++, callDto.getSeq());
			count = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return count;
	}

	@Override
	public int delete(int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			String sql = "";
			sql+="delete \n";
			sql+="from call\n";
			sql+="where pcall_id=? \n";			
			int idx=1;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(idx++, seq);
			count = pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql="";
			sql+="delete \n";
			sql+="from board \n";
			sql+="where seq=? \n";
			idx=1;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(idx++, seq);
			count = pstmt.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt);
		}
		return count;
	}



}
