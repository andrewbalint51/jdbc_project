package com.cydeo.jdbcTests.day01_jdbcIntro;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_jdbcIntro {

    String dbUrl = "jdbc:oracle:thin:@3.85.239.95:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {

            //Create connection
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //Helps us execute queries
        Statement statement = conn.createStatement();

        //Stores data after execution
        ResultSet rs = statement.executeQuery("select * from DEPARTMENTS WHERE MANAGER_ID IS NOT NULL");


        while(rs.next()){
            System.out.println(rs.getInt(1)+" - "+rs.getString(2)+" - "+
                    rs.getString(3)+" - "+
                    rs.getString(4));
        }

        System.out.println("--------------------------------------------");

        rs = statement.executeQuery("SELECT * FROM LOCATIONS");

        while(rs.next()){
            System.out.println(rs.getString(2)+" - "+rs.getString(4));
        }

        rs.close();
        statement.close();
        conn.close();
    }

}
