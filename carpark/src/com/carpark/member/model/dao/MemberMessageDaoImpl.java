package com.carpark.member.model.dao;

import java.sql.*;
import java.util.*;

import com.carpark.db.DBClose;
import com.carpark.db.DBConnection;
import com.carpark.member.model.MessageDto;

public class MemberMessageDaoImpl implements MemberMessageDao {

	private static MemberMessageDao memberMessageDao;
	
	static {
		memberMessageDao = new MemberMessageDaoImpl();
	}
	
	private MemberMessageDaoImpl(){}

	public static MemberMessageDao getMemberMessageDao() {
		return memberMessageDao;
	}

	@Override
	public int writeArticle(MessageDto messageDto) {
		int seq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "insert all \n";
			sql += "into board (seq, user_id, subject, content, bcode, logtime) \n";
			sql += "values (?, ?, ?, ?, ?, ?, sysdate) \n";
			sql += "into album (mseq, seq, receiver_id, msg_flag) \n";
			sql += "values (msg_mseq.nextval, ?, ?, ?) \n";
			sql += "select * from dual";
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setInt(++idx, messageDto.getSeq());
			//pstmt.setString(++idx, messageDto.getUser_id());session 정보 가져와야함
			pstmt.setString(++idx, messageDto.getSubject());
			pstmt.setString(++idx, messageDto.getContent());
			pstmt.setInt(++idx, messageDto.getBcode());
			pstmt.setInt(++idx, messageDto.getSeq());
			pstmt.setString(++idx, messageDto.getReceiverId());
			pstmt.setInt(++idx, messageDto.getMsgFlag());

			pstmt.executeUpdate();
			seq = messageDto.getSeq();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		return seq;
	}

	@Override
	public MessageDto viewArticle(int seq) {
		MessageDto messageDto = new MessageDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.makeConnection();
			String sql = "";
			sql += "select b.seq, b.subject, b.content b.user_id, b.logtime, b.bcode, \n";
			sql += "m.mseq, m.receive_id \n";
			sql += "from board b, message m \n";
			sql += "where b.seq = m.seq \n";
			sql += "and b.seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				messageDto.setSeq(seq);
				messageDto.setSubject(rs.getString("subject"));
				messageDto.setContent(rs.getString("content"));
				messageDto.setUserID(rs.getString("user_id"));
				messageDto.setLogtime(rs.getString("logtime"));
				messageDto.setBcode(rs.getInt("bcode"));
				messageDto.setMseq(rs.getInt("mseq"));
				messageDto.setReceiverId(rs.getString("receive_id"));
				messageDto.setMsgFlag(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return messageDto;
	}

	@Override
	public List<MessageDto> listArticle(Map<String, String> map) {
		List<MessageDto> list = new ArrayList<MessageDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String key = map.get("key");
		String word = map.get("word");
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sb = new StringBuffer();
			sb.append("select b.* \n");
			sb.append("from ( \n");
			sb.append("	select rownum rn, a.* \n");
			sb.append("	from ( \n");
			sb.append("		select b.seq, b.user_id, b.subject, b.content, b.hit, b.bcode, \n");
			sb.append("		       decode(to_char(b.logtime, 'yymmdd'), \n");
			sb.append("			      to_char(sysdate, 'yymmdd'), to_char(b.logtime, 'hh24:mi:ss'), \n");
			sb.append("							  to_char(b.logtime, 'yy.mm.dd')) logtime, \n");
			sb.append("		       m.mseq, m.receiver_id, m.msg_flag \n");
			sb.append("		from board b, message m \n");
			sb.append("		where b.seq = m.seq \n");
			sb.append("		and b.bcode = ? \n");
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					if("subject".equals(key))
						sb.append("		and b.subject like '%'||?||'%' \n");
					else if("content".equals(key))
						sb.append("		and b.content like '%'||?||'%' \n");
					else
						sb.append("		and b." + key + " = ? \n");						
				}
			}
			sb.append("		order by b.seq desc \n");
			sb.append("	      ) a \n");
			sb.append("	where rownum <= ? \n");
			sb.append("      ) b \n");
			sb.append("where b.rn > ? ");
			pstmt = conn.prepareStatement(sb.toString());
			int idx = 0;
			pstmt.setString(++idx, map.get("bcode"));
			if(key != null && !key.isEmpty()) {
				if(word != null && !word.isEmpty()) {
					pstmt.setString(++idx, map.get("word"));				
				}
			}
			pstmt.setString(++idx, map.get("end"));
			pstmt.setString(++idx, map.get("start"));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MessageDto messageDto = new MessageDto();
				messageDto.setSeq(rs.getInt("seq"));
				messageDto.setSubject(rs.getString("subject"));
				messageDto.setContent(rs.getString("content"));
				messageDto.setUserID(rs.getString("user_id"));
				messageDto.setLogtime(rs.getString("logtime"));
				messageDto.setBcode(rs.getInt("bcode"));
				messageDto.setMseq(rs.getInt("mseq"));
				messageDto.setReceiverId(rs.getString("receiver_id"));
				messageDto.setMsgFlag(rs.getInt("msg_flag"));
				
				list.add(messageDto);
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
			sql = "delete from message where seq = ? \n";
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
