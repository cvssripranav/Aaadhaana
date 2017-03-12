package com.realtimetpo.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 import javax.mail.*;
 import javax.mail.internet.*;
import com.realtimetpo.daos.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.realtimetpo.entities.*;

import com.realtimetpo.daos.OperationsDao;

import com.realtimetpo.factories.*;

/**
 * Servlet implementation class ForgotPasswordController
 */
@WebServlet("/ForgotPasswordController")
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HashMap<String, Object> JSONROOT = new HashMap<String, Object>();

	 Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    
	    public ForgotPasswordController()
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
		String username = request.getParameter("username");
		String userid = request.getParameter("userid");
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;


		String id = "";
		String pass="";
		String emailid="";
		int ids = 0;
		try {
				 rs = stmt.executeQuery("select * from users where  userid='"+ userid + "' and name='"+ username + "'");
				 
		if (rs.next()) { 
			System.out.println("5555"+rs.getString("userid"));
		id = rs.getString("userid");
		 emailid=rs.getString("email");
		 pass=rs.getString("password");
		} 
		if(id.equals(userid))
		{
			
			String host="smtp.gmail.com";  
			final String user="13h61a1216@cvsr.ac.in";//change accordingly  
			 final String password="cvsr1234";//change accordingly  
			  
			 
			//String to=request.getParameter("rid");//change accordingly  

			 //Get the session object  
			 Properties props = new Properties();  
			 props.put("mail.smtp.host",host);  
			 props.put("mail.smtp.auth", "true");
			 //props.put("mail.smtp.port", "25"); 
			 //props.put("mail.debug", "true"); 
			 //props.put("mail.smtp.auth", "true"); 
			 props.put("mail.smtp.starttls.enable","true"); 
			 //props.put("mail.smtp.EnableSSL.enable","true");
			   
			 Session ss = Session.getDefaultInstance(props,  
			  new javax.mail.Authenticator() {  
			    protected PasswordAuthentication getPasswordAuthentication() {  
			  return new PasswordAuthentication(user,password);  
			    }  
			  });  

			 //Compose the message  
			  try {  
			   MimeMessage message = new MimeMessage(ss);  
			   message.setFrom(new InternetAddress(user));  
			     try{
			   	             
			   	                	 message.addRecipient(Message.RecipientType.TO,new InternetAddress(emailid));  
			   	                  message.setSubject("Password Retrieval");  
			   	                  message.setText("As per our records the password of user with id "+ id+" is "+pass+". We request you to keep password safe.   ");  
			   	                 }catch (Exception e) {
			   	            	  e.printStackTrace();
			   	         	  out.println("<h2>Please try again.....</h2>");
			   	           }

			   	                	 

			     
			  //send the message  
			   Transport.send(message);  
			   request.getRequestDispatcher("TaxLogin.jsp").include(request, response);  
				//rd = request.getRequestDispatcher("registration.html");
			    //rd.include(request, response);
			 // response.sendRedirect(request.getContextPath() + "/index.jsp");
				out.println("<br><br><br><center><font color=white Style=top:0px >Mail has been sent successfully to your registerd email.</font></center>");
				out.close();

					 
			   } catch (MessagingException e) {
				   request.getRequestDispatcher("TaxLogin.jsp").include(request, response);  
					//rd = request.getRequestDispatcher("registration.html");
				    //rd.include(request, response);
				 
				   out.println("<h2>Please try again.....</h2>");
				   out.close();
				   e.printStackTrace();} 
			 

						
		
		} else {
			 request.getRequestDispatcher("ForgotPasword.jsp").include(request, response);  
				//rd = request.getRequestDispatcher("registration.html");
			    //rd.include(request, response);
			 // response.sendRedirect(request.getContextPath() + "/index.jsp");
				out.println("<center><font color=red>Wrong name/id</font></center>");
				out.close();
		}
		/*}else{
		out.println("new password and confirm new password is not matching");
		}*/
		
		} catch (Exception e) {
		out.println(e);
		}
		
}
}