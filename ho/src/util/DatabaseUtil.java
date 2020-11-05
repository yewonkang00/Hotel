package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
			// 1. DB연결
			String dbID = "hotel";
			String dbPassword = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. Oracle Driver 연결
			
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
