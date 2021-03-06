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
 <style>
  	table
  	{
  		background-color:white!important;
  		width:70%;
  		border-bottom: 5px solid #1e90ff!important;
  		border-radius:20px;
  	}
  	
  	  thead
  {
  	background-color:#1e90ff!important;
  	color:white!important;
  	
  
  }
  </style>

	
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
		        <li><a href="requests.jsp">Student Requests</a></li>
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
		        <li><a href=<%= "\"RequestStatus.jsp?rno=" + session.getAttribute("username") + "&department="+session.getAttribute("department")+"\"" %>  id="semMarks">Request Status</a></li>
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
			   <img src="KuboMainBG.png">
			   <div class="carousel-caption">
			   <h1>WELCOME</h1>
			   <p> insert some text here </p>
			   </div>
			  </div>

			  <div class="item">
				<img src="KuboMainBG.png">
				<div class="carousel-caption">
			   <h1>WELCOME</h1>
			   <p> insert some text here </p>
			   </div>
			  </div>
			
			  <div class="item">
				<img src="KuboMainBG.png">
				<div class="carousel-caption">
			   <h1>WELCOME</h1>
			   <p> insert some text here </p>
			   </div>
			  </div>

			  <div class="item">
				<img src="KuboMainBG.png">
				<div class="carousel-caption">
			  <h1>WELCOME</h1>
			   <p> insert some text here </p>
			   </div>
			  </div>
			</div>

			 Left and right controls 
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
			<h1 class="rowhead"> About Us </h1>
			<p> <span style="font-size:40px;">"T</span>he AGI always strive towards industry readiness of students and it is keen on aligning the AGI with the industry to practice industry standards and requirements"
			</p>
			<p><span style="font-size:40px;">"T</span>he role of the Training & Placements Department is to provide adequate training to enable students industry ready and offer placement assistance by inviting several industrial partners"
			
			</p>
			<p style=" font-size:18px"> The Placement Department will ensure to:
			
				<ul style=" font-size:15px;color:white;font-family:basic">
					<li>Provide comprehensive training to all students in line with the company requirements</li>
					<li>Create employment opportunities for the students</li>
					<li>Deliver guest lectures from industrial experts to inculcate industry exposure to students</li>
					<li>facilitate interactions between the institution and industry</li>
					<li>maximize the number student placements through on-campus placement</li>
					<li>Anurag training and placement division is ranked among the best in the south and has a key impressive record with 85% of our eligible students being placed with leading Multi National and similar business giants</li>
					<li>Anurag students are regularly trained both by internal and external experts. Anurag Group has special M.O.Us and tie-ups with some blue chip companies for training</li>
					<li>Annual placements on Anurag campus always yielded very good first jobs to aspirants</li>
				</ul>
			</p>
		</div>

	</div>


	<div class="row" id="home-row-3">
		<h1 class="rowhead"> The Team </h1>
	             <table align="center" class="table table-striped" cellpadding="2" cellspacing="2">
					<thead>
					<tr>
					<td><strong>S.No</strong></td>
					<td><strong>Faculty Name</strong></td>
					<td><strong>Designation</strong></td>
					<td><strong>Contact</strong></td>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td>1</td>
					<td>Dr. K. Mamatha</td>
					<td>Training &amp; Placement Officer</td>
					<td>placements@cvsr.ac.in</td>
					</tr>
					<tr>
					<td>2</td>
					<td>Mr. V. Amarnath</td>
					<td>Coordinator (CSE)</td>
					<td>placements.cse@cvsr.ac.in</td>
					</tr>
					<tr>
					<td>3</td>
					<td>Mrs. T. Ashalatha</td>
					<td>Coordinator (IT)</td>
					<td>placements.it@cvsr.ac.in</td>
					</tr>
					<tr>
					<td>4</td>
					<td>Mr. D. Ram Babu</td>
					<td>Coordinator (Electronics)</td>
					<td>placements.ece@cvsr.ac.in</td>
					</tr>
					<tr>
					<td>5</td>
					<td>Mr. K. Mahesh</td>
					<td>Coordinator (Electrical)</td>
					<td>placements.eee@cvsr.ac.in</td>
					</tr>
					<tr>
					<td>6</td>
					<td>Mr. Nagamalleshwar</td>
					<td>Coordinator (Mechanical)</td>
					<td>placements.mech@cvsr.ac.in</td>
					</tr>
					<tr>
					<td>7</td>
					<td>Ms. Sk. Shaheda</td>
					<td>Coordinator (Chemical)</td>
					<td>placements.chem@cvsr.ac.in</td>
					</tr>
					<tr>
					<td>8</td>
					<td>Mr. Satyanarayana</td>
					<td>Coordinator (Civil)</td>
					<td>placements.civil@cvsr.ac.in</td>
					</tr>
					<tr>
					<td>9</td>
					<td>Ms. C. Supriya</td>
					<td>Coordinator (MBA)</td>
					<td>placements.mba@cvsr.ac.in</td>
					</tr>
					</tbody>
					</table>
		
	</div>
	
	
	<div class="row" id="home-row-4">

		
	</div>
	
		

</div>
	<footer>
		<p>	Anurag Group of Institutions- Centralized Placement Web Application<br>
			 E-mail:cvsrit13@gmail.com<br>
			 &copy;All rights reserved, Department of Information Technology
			 <br>2013-2017
		 </p>
	</footer>

</body>
</html>
