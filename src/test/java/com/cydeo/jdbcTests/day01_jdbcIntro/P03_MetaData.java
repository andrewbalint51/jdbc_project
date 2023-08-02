package com.cydeo.jdbcTests.day01_jdbcIntro;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P03_MetaData {

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
        ResultSet rs = statement.executeQuery("select * from EMPLOYEES");

        DatabaseMetaData metaData = conn.getMetaData();

        System.out.println(metaData.getUserName());

        ResultSetMetaData rsmd = rs.getMetaData();


        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            System.out.print(rsmd.getColumnName(i));
            if(i<rsmd.getColumnCount()){
                System.out.print(" - ");
            }
        }
        System.out.println();

        while(rs.next()){

            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                System.out.print(rs.getString(i));
                if(i<rsmd.getColumnCount()){
                    System.out.print(" - ");
                }
            }
            System.out.println();

        }

        rs.close();
        statement.close();
        conn.close();
    }
}
