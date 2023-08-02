package com.cydeo.jdbcTests.day02;

import com.cydeo.jdbcTests.utility.DB_Util;
import org.junit.jupiter.api.Test;

public class P02_DBUtilsPractice {


    @Test
    public void task1(){
        DB_Util.createConnection();

        DB_Util.runQuery("Select * from EMPLOYEES");

        System.out.println(DB_Util.getColumnDataAsList(2));

        DB_Util.destroy();
    }
}
