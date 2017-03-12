package com.realtimetpo.factories;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

    public static Connection con = null;
static
{
    try
    {
        Class.forName("com.mysql.jdbc.Driver"); 
        con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/test1", 
                    "root", "arjun@23");
            
    }catch(Exception e){System.out.println(e);}
}
public static Connection getConnection()
{
    return con;
}
}
