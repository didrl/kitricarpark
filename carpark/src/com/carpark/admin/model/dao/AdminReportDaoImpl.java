package com.carpark.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.carpark.admin.model.PenaltyDto;
import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MessageDto;
import com.carpark.member.model.ReportDto;

public class AdminReportDaoImpl implements AdminReportDao {

	private static AdminReportDao adminReportDao;
	
	static {
		adminReportDao = new AdminReportDaoImpl();
	}
	
	private AdminReportDaoImpl(){}

	public static AdminReportDao getAdminReportDao() {
		return adminReportDao;
	}

	@Override
	public int writeArticle(PenaltyDto penaltyDto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			String sql = "";
			sql += "insert into penalty (penalty_num, user_id, penalty_code, penalty_date, penalty_memo, seq) \n";
			sql += "values (report_num_cseq.nextval, ?, ?, sysdate, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, penaltyDto.getUser_id());
			pstmt.setInt(2, penaltyDto.getPenalty_code());
			pstmt.setString(3, penaltyDto.getPenalty_content());
			pstmt.setInt(4, penaltyDto.getSeq());
			cnt = pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql = "";
			sql += "update member \n";
			sql += "set penalty = penalty + (select penalty_point from evaluation where penalty_point = ?) \n";
			sql += "where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, penaltyDto.getPenalty_code());
			pstmt.setString(2, penaltyDto.getUser_id());
			cnt = pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
			
			sql = "";
			sql += "update report \n";
			sql += "set report_flag = 1 \n";
			sql += "where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, penaltyDto.getSeq());
			pstmt.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		return cnt;
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
				reportDto.setUserID(rs.getString("user_id"));
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
	public void modifyArticle(int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			
			String sql = "";
			sql += "update table report \n";
			sql += "set report_flag = 1 \n";
			sql += "where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
	}

	@Override
	public List<ReportDto> listFlagArticle(Map<String, String> map) {
		List<ReportDto> list = new ArrayList<ReportDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		String flag = map.get("flag");
		
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
			sql += "			and report_flag = ? \n";
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
			pstmt.setString(++idx, flag);
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
				reportDto.setUserID(rs.getString("user_id"));
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
	public int penaltyPoint(String userId) {
		int penalty = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select penalty from member where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				penalty = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return penalty;
	}
	
	
}
