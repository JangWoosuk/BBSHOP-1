package com.bbshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class test2 {

	static {

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {

		try (Connection con = DriverManager.getConnection(

				"jdbc:oracle:thin:@localhost:1522:orcl", "scott", "1234")) {
			System.out.println(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
