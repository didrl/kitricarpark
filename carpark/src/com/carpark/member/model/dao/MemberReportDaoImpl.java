package com.carpark.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.ReportDto;

public class MemberReportDaoImpl implements MemberReportDao {

	private static MemberReportDao memberReportDao;
	
	static {
		memberReportDao = new MemberReportDaoImpl();
	}
	
	private MemberReportDaoImpl(){}

	public static MemberReportDao getMemberReportDao() {
		return memberReportDao;
	}

	@Override
	public int writeArticle(ReportDto reportDto) {
		int seq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "insert all \n";
			sql += "into board (seq, user_id, subject, contents, bcode, logtime) \n";
			sql += "values (?, ?, ?, ?, ?, sysdate) \n";
			sql += "into report (cseq, seq, park_id, user_id, report_flag) \n";
			sql += "values (message_num_mseq.nextval, ?, ?, ?, 0) \n";
			sql += "select * from dual";
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setInt(++idx, reportDto.getSeq());
			pstmt.setString(++idx, reportDto.getUserID());
			pstmt.setString(++idx, reportDto.getSubject());
			pstmt.setString(++idx, reportDto.getContent());
			pstmt.setInt(++idx, reportDto.getBcode());
			
			pstmt.setInt(++idx, reportDto.getSeq());
			pstmt.setInt(++idx, reportDto.getPark_id());
			pstmt.setString(++idx, reportDto.getReport_id());
			pstmt.executeUpdate();
			seq = reportDto.getSeq();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		return seq;
	}

	@Override
	public ReportDto viewArticle(int seq) {
		ReportDto reportDto = new ReportDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select b.seq, bcode, b.user_id, subject, contents, \n";
			sql += "		decode(to_char(logtime, 'yymmdd'), \n";
			sql += "				to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n";
			sql += "				to_char(b.logtime, 'yy.mm.dd')) logtime, \n";
			sql += "cseq, park_id, r.user_id as report_id, report_flag \n";
			sql += "from board b, report r \n";
			sql += "where b.seq = r.seq \n";
			sql += "and b.seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reportDto.setSeq(rs.getInt("seq"));
				reportDto.setBcode(rs.getInt("bcode"));
				reportDto.setUserID(rs.getString("user_id"));
				reportDto.setSubject(rs.getString("subject"));
				reportDto.setContent(rs.getString("contents"));
				reportDto.setLogtime(rs.getString("logtime"));
				reportDto.setCseq(rs.getInt("cseq"));
				reportDto.setPark_id(rs.getInt("park_id"));
				reportDto.setReport_id(rs.getString("report_id"));
				reportDto.setReport_flag(rs.getInt("report_flag"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return reportDto;
	}

	@Override
	public List<ReportDto> listArticle(Map<String, String> map) {
		List<ReportDto> list = new ArrayList<ReportDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		String userId = map.get("userId");
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select c.rn, c.seq, c.bcode, c.user_id, c.subject, c.contents, c.logtime, c.cseq, c.park_id, c.report_id, c.report_flag  \n";
			sql += "from ( \n";
			sql += "	  select rownum rn, a.seq, a.bcode, a.user_id, a.subject, a.contents, a.logtime, a.cseq, a.park_id, a.report_id, a.report_flag \n";
			sql += "	  from ( \n";
			sql += " 			select b.seq, b.bcode, b.user_id, b.subject, b.contents, \n";
			sql += "						decode(to_char(logtime, 'yymmdd'), \n";
			sql += "							to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n";
			sql += "								to_char(b.logtime, 'yy.mm.dd')) logtime, \n";
			sql += "				   r.cseq, r.park_id, r.user_id as report_id, report_flag \n";
			sql += "			from board b, report r \n";
			sql += "			where b.seq = r.seq \n";
			sql += "			and b.user_id = ? \n";
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("subject".equals(key))
						sql += "			and b.subject like '%'||?||'%' \n";
					else
						sql += "			and b." + key + " = ? \n";						
				}
			}
			sql += "			order by b.seq desc \n";
			sql += "		   ) a \n";
			sql += "	   where rownum <= ? \n";
			sql += "      ) c \n";
			sql += "where c.rn > ? ";
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, userId);
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, map.get("word"));				
				}
			}
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReportDto reportDto = new ReportDto();
				reportDto.setSeq(rs.getInt("seq"));
				reportDto.setBcode(rs.getInt("bcode"));
				reportDto.setSubject(rs.getString("subject"));
				reportDto.setContent(rs.getString("contents"));
				reportDto.setLogtime(rs.getString("logtime"));
				reportDto.setCseq(rs.getInt("cseq"));
				reportDto.setPark_id(rs.getInt("park_id"));
				reportDto.setReport_id(rs.getString("report_id"));
				reportDto.setReport_flag(rs.getInt("report_flag"));
				
				list.add(reportDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return list;
	}

	@Override
	public void deleteArticle(int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			String sql = "";
			sql = "delete from report where seq = ? \n";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete from board where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
	}
	
	
}
