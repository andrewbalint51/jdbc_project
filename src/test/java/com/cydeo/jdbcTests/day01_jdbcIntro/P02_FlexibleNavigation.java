package com.cydeo.jdbcTests.day01_jdbcIntro;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02_FlexibleNavigation {

    String dbUrl = "jdbc:oracle:thin:@3.85.239.95:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {

        //Create connection
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //Helps us execute queries
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        //Stores data after execution
        ResultSet rs = statement.executeQuery("select FIRST_NAME, LAST_NAME from EMPLOYEES");

        while(rs.next()){
            System.out.println(rs.getString(1)+" "+rs.getString(2));
        }

        rs.close();
        statement.close();
        conn.close();
    }
}
