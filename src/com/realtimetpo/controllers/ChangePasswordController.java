package com.realtimetpo.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.realtimetpo.daos.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.realtimetpo.entities.*;
/*
import daos.OperationsDao;
import entities.Salary;
import factories.ConnectionFactory;*/
import com.realtimetpo.factories.ConnectionFactory;

/**
 * Servlet implementation class ChangePasswordController
 */
@WebServlet("/ChangePasswordController")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HashMap<String, Object> JSONROOT = new HashMap<String, Object>();

	 Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    
	    public ChangePasswordController()
	    {
	        try
	        {
	            con = ConnectionFactory.getConnection();
	            stmt = con.createStatement();
	        }catch(Exception e){System.out.println(e);}
	    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String OldPassword = request.getParameter("OldPassword");
		String Newpass = request.getParameter("newpassword");
		String conpass = request.getParameter("conpassword");
		String ids=request.getParameter("userid");
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;


		String pass = "";
		int id = 0;
		try {
				 rs = stmt.executeQuery("select * from users where  userid='"+ ids + "'");
				 
		if (rs.next()) { 
			System.out.println("5555"+rs.getString("password"));
		pass = rs.getString("password");
		} 
		if(Newpass.equals(conpass))
		{
		if (pass.equals(OldPassword)) {
		stmt = con.createStatement();
		int i = stmt.executeUpdate("update users set password='"+ Newpass + "' where userid='"+ ids + "'");
		 request.getRequestDispatcher("login.jsp").include(request, response);  
			//rd = request.getRequestDispatcher("registration.html");
		    //rd.include(request, response);
		 // response.sendRedirect(request.getContextPath() + "/index.jsp");
			out.println("<center><font color=red>Please login with new password to continue</font></center>");
			out.close();

		out.println("Password changed successfully");
		
		
		} else {
			 request.getRequestDispatcher("changepassword.jsp").include(request, response);  
				//rd = request.getRequestDispatcher("registration.html");
			    //rd.include(request, response);
			 // response.sendRedirect(request.getContextPath() + "/index.jsp");
				out.println("<center><font color=red>Old Password doesn't match</font></center>");
				out.close();
		}
		/*}else{
		out.println("new password and confirm new password is not matching");
		}*/
		}
		} catch (Exception e) {
		out.println(e);
		}
		
}
}