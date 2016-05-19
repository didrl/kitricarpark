package com.carpark.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	
	public static Connection makeConnection() throws SQLException {
		Connection conn = null;
		try {
			Context context = new InitialContext();
			Context root = (Context) context.lookup("java:comp/env");
			DataSource dataSource = (DataSource) root.lookup("jdbc/board");
			conn = dataSource.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
