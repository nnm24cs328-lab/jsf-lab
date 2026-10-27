
package com.studentcrud;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

	private static final String URL = "jdbc:mysql://localhost:3306/students_db";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Ishta_jain@sql26";

	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.printf("MySQL JDBC Driver not found.", e);
		}

		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
}
