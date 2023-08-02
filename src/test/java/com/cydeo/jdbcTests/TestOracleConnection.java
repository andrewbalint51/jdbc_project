package com.cydeo.jdbcTests;

import java.sql.*;

public class TestOracleConnection {

    public static void main(String[] args) throws SQLException {
        String dbUrl = "jdbc:oracle:thin:@3.85.239.95:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";

        //Crteate connection
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //Helps us execute queries
        Statement statement = conn.createStatement();

        //Stores data after execution
        ResultSet rs = statement.executeQuery("select * from EMPLOYEES");

       /* rs.next();
        System.out.println("-----------FIRST ROW------------");
        //Pointer in first row

        System.out.println(rs.getString(1)); //First row first column

        System.out.println(rs.getString("REGION_NAME"));

        rs.next();
        System.out.println("-----------SECOND ROW------------");

        System.out.println(rs.getInt(1)+" - "+rs.getString(2));

        rs.next();
        System.out.println("-----------THIRD ROW------------");

        System.out.println(rs.getInt(1)+" - "+rs.getString(2));

        rs.next();
        System.out.println("-----------THIRD ROW------------");

        System.out.println(rs.getInt(1)+" - "+rs.getString(2));*/

        while(rs.next()){
            System.out.println(rs.getInt(1)+" - "+rs.getString(2)+" - "+
                               rs.getString(3));
        }


        rs.close();
        statement.close();
        conn.close();
    }
}
