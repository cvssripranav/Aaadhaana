<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Kubo | Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>



<link rel="stylesheet" type="text/css" href="KuboHome.css"/> 

	
</head>
<body>

<%@ page import=" java.io.File" %>
<%@ page import ="java.io.FileOutputStream"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.ResultSet"%>s
<%@ page import=" java.sql.Statement"%>
<%@ page import ="com.realtimetpo.daos.EligibilityDao"%>
<%@ page import ="com.realtimetpo.entities.Eligibility"%>
<%@ page import=" com.realtimetpo.factories.DAOFactory"%>
<%@ page import=" com.realtimetpo.factories.EntityFactory"%>
<%@page import="java.util.*,java.io.*,java.lang.*,javax.servlet.*,javax.servlet.http.*"%>
<%@ page import=" java.sql.* " %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
 
 if(null!=session.getAttribute("username"))
{
	 System.out.println(session.getAttribute("department"));
	if(session.getAttribute("department").equals("admin"))
	{ System.out.println(session.getAttribute("department"));
	%>
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		   
		    <div class="collapse navbar-collapse" id="myNavbar">
			
		      <ul class="nav navbar-nav">
			  
		        <li><a href="KuboHome.jsp" style="background-color:white; color:#1e90ff">Home</a></li>
				  
				<li><a href="trytpo.jsp">EC Generator</a></li>
		        <li><a href="ExCD.jsp">Excel <i>to</i> Data</a></li>
		        <li><a href="#">Notification Issuer</a></li>
				<li><a href="Querydb.jsp">Query DB</a></li>
				<li><a href="#">SQL Log</a></li>
				<li><a href="#">Blog</a></li>
				<li><a href="Logout" id="logout">Logout</a></li>
				
		       
		      </ul>
		      
		    </div>
		  </div>
		</nav>
	<% 	
	}
	else
	{	%>
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    
		    <div class="collapse navbar-collapse" id="myNavbar">
			
		      <ul class="nav navbar-nav">
			  
		        <li><a href="KuboHome.jsp" style="background-color:white; color:#1e90ff">Home</a></li>
				 
				<li><a href=<%= "\"StdentDetails.jsp?rno="+session.getAttribute("username")+"&department="+session.getAttribute("department")+"\"" %>>My Profile</a></li>
				<li><a href=<%= "\"StudentSemPerformance.jsp?rno="+session.getAttribute("username")+"&department="+session.getAttribute("department")+"\"" %>>My Marks</a></li>
		        <li><a href=<%= "\"Notify.jsp?rno="+session.getAttribute("username")+"&department="+session.getAttribute("department")+"\"" %>>Notify</a></li>
				<li><a href="#">Blog</a></li>
				<li><a href="Logout" id="logout">Logout</a></li>
				<li><a href="#" style="background-color:white; color:#1e90ff">Welcome  <%=" "+session.getAttribute("name")+"! "%></a></li>
				
		      </ul>
		      
		    </div>
		  </div>
		</nav>
		
<% 	}
}
 else{
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
  
    <div class="collapse navbar-collapse" id="myNavbar">
	
      <ul class="nav navbar-nav">
	  
        <li><a href="KuboHome.jsp" style="background-color:white; color:#1e90ff">Home</a></li>
		 
		<li><a href="#">Blog</a></li>
		<li><a href="login.jsp">Login</a></li>
		
	
          </ul>
       
      
    </div>
  </div>
</nav>

  
<%} %>  

<div class="container-fluid">
	<div class="row" id="home-row-1">
		  <div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
			  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			  <li data-target="#myCarousel" data-slide-to="1"></li>
			  <li data-target="#myCarousel" data-slide-to="2"></li>
			  <li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
			  <div class="item active">
			   <img src="webbg21.jpg">
			   <div class="carousel-caption">
			   <h1>WELCOME</h1>
			   <p> insert some text here </p>
			   </div>
			  </div>

			  <div class="item">
				<img src="webbg20.jpg">
				<div class="carousel-caption">
			   <h1>WELCOME</h1>
			   <p> insert some text here </p>
			   </div>
			  </div>
			
			  <div class="item">
				<img src="webbg18.jpg">
				<div class="carousel-caption">
			   <h1>WELCOME</h1>
			   <p> insert some text here </p>
			   </div>
			  </div>

			  <div class="item">
				<img src="webbg19.jpg">
				<div class="carousel-caption">
			  <h1>WELCOME</h1>
			   <p> insert some text here </p>
			   </div>
			  </div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			  <span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			  <span class="sr-only">Next</span>
			</a>
		</div>
	</div>

  
	<div class="row" id="home-row-2">

		<div class="col-xs-12">
			<h1> About TPO </h1>
			<p> 
				Some matter pertaining to the TPO.
			</p>
		</div>

	</div>


	<div class="row" id="home-row-3">

		
	</div>
	
	
	<div class="row" id="home-row-4">

		
	</div>
	
		

</div>
	<footer>
		<p>	Kubo - Centralized Placement Web Application<br>
			 E-mail:cvsrit13@gmail.com<br>
			 &copy;All rights reserved, Department of Information Technology
			 <br>2013-2017
		 </p>
	</footer>

</body>
</html>
