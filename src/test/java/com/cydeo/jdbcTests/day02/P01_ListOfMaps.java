package com.cydeo.jdbcTests.day02;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.*;

public class P01_ListOfMaps {

    String dbUrl = "jdbc:oracle:thin:@3.85.239.95:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1(){
        Map<String, Object> rowMap = new HashMap<>();

        System.out.println("----------------Row Map One-----------------");

    }

    @Test
    public void task2() throws SQLException {

        //Create connection
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //Helps us execute queries
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);


        //Stores data after execution
        ResultSet rs = statement.executeQuery("select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES");

        ResultSetMetaData rsmd = rs.getMetaData();

        rs.next();

        Map<String, Object> rowMap1 = new HashMap<>();

        rowMap1.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap1.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap1.put(rsmd.getColumnName(3), rs.getString(3));




        rs.close();
        statement.close();
        conn.close();

    }

    @Test
    public void task3() throws SQLException {

        //Create connection
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        //Helps us execute queries
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        //Stores data after execution
        ResultSet rs = statement.executeQuery("select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES");
        ResultSetMetaData rsmd = rs.getMetaData();


        List<Map<String, Object>> dataList = new ArrayList<>();


        while(rs.next()){

            Map<String, Object> rowMap = new HashMap<>();

            int columnCount = rsmd.getColumnCount();

            for(int i = 1 ; i<=columnCount;i++){
                rowMap.put(rsmd.getColumnName(i), rs.getString(i));

            }
            dataList.add(rowMap);

        }

        for (Map<String, Object> stringObjectMap : dataList) {
            System.out.println(stringObjectMap);
        }

        rs.close();
        statement.close();
        conn.close();

    }

}
