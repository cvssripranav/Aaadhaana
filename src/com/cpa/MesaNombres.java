package com.cpa;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MesaNombres
 */
@WebServlet("/MesaNombres")
public class MesaNombres extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<String> tablist = new ArrayList<>();
		
		 
	      try{
				
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/test";
	            Connection con = DriverManager.getConnection(url,"root","arjun@23");
				 Statement stmt = con.createStatement();
				 System.out.println("hello before sql");
				 
				 String query = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='test'";
				 ResultSet rs = stmt.executeQuery(query);
				 while(rs.next())
				 {
					 tablist.add(rs.getString(1));
					 System.out.println("hello inside");
				 }
				
				
	}
	      catch(Exception d){d.printStackTrace();}
	      	Gson gson = new Gson();
			 String json = gson.toJson(tablist);

	        
	        response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
	      
	}
	

	

}

