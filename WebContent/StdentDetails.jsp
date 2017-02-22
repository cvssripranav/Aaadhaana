<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="nav_bar.css"/>
<link rel="stylesheet" type="text/css" href="KuboStudent.css"/> 
<title>Kubo | Student Details</title>
 <script>
 
 function addInput()
 {
	 <% String percents=request.getParameter("percent");%>
var percent="<%=percents%>";
	 
		    $('#mail').load('inbox.jsp?percent='+percent);
		
        
}
 </script> 
<style>
table
  	{
  		background-color:white!important;
  	}
  </style>
  
    <script data-main="js/app" src="js/lib/require.js"></script>
  

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <!--<div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="KuboHome.html"><img src="index_bg.png" alt="Brand" /></a>
    </div>-->
    <div class="collapse navbar-collapse" id="myNavbar">
	
      <ul class="nav navbar-nav">
	  
        <li><a href="KuboHome.jsp">Home</a></li>
		  <!--<li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">EC Generator<span class="caret"></span></a>
          <ul class="dropdown-menu">
            
            <li><a href="events.html">Department Tree</a></li>
            <li><a href="chemical-tech-events.html">CHEMICAL</a></li>
			<li><a href="civil-tech-events.html">CIVIL</a></li>
			<li><a href="cse-tech-events.html">CSE</a></li>
			<li><a href="ece-tech-events.html">ECE</a></li>
			<li><a href="eee-tech-events.html">EEE</a></li>
			<li><a href="it-tech-events.html">IT</a></li>
			<li><a href="mech-tech-events.html">MECH</a></li>
			<li><a href="mba-tech-events.html">MBA</a></li>
			<li><a href="pharm-tech-events.html">PHARMACY</a></li>
          </ul>
        </li>-->
		<li><a href="#" style="background-color:white; color:#1e90ff"> My Profile</a></li>
		 <li><a href=<%= "\"StudentSemPerformance.jsp?rno=" + request.getParameter("rno") + "&department="+request.getParameter("department")+"\"" %> id="studentdetails">My Marks</a></li>
        <li><a href=<%= "\"Notify.jsp?rno=" + request.getParameter("rno") + "&department="+request.getParameter("department")+"\"" %>  id="semMarks">Notify</a></li>
		<li><a href="#">Blog</a></li>
		<li><a href="Logout" id="logout">Logout</a></li>
		<li><a href="#" style="background-color:white; color:#1e90ff">Welcome  <%=" "+session.getAttribute("name")+"! "%></a></li>
		<!-- <li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">REGISTER<span class="caret"></span></a>
          <ul class="dropdown-menu">
            
            <li><a href="events.html">Tech Zone</a></li>
            <li><a href="common.html">Open Zone</a></li>
			<li><a href="skill.html">Skill Zone </a></li>
			
		
          </ul>
        </li>-->
      </ul>
      
    </div>
  </div>
</nav>



<div class="container" id="con1">
<h3 id="admin-heading" class="col-xs-offset-3"> <span>Here<%=" "+session.getAttribute("name")+", "%> is your profile</span></h3>
<table align="center" cellpadding="4" cellspacing="4" id="studentDetails"  class="table table-striped">
<tr>

</tr>
<tr>


</tr>
<%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
<%@ page import=" java.io.File" %>
<%@ page import ="java.io.FileOutputStream"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import=" java.sql.Statement"%>
<%@ page import ="com.realtimetpo.daos.*"%>
<%@ page import ="com.realtimetpo.entities.*"%>
<%@ page import=" com.realtimetpo.factories.*"%>
<%@ page import=" com.realtimetpo.factories.EntityFactory"%>

<%@ page import=" java.sql.* " %>
<%
response.setContentType("text/html");  
//PrintWriter outs=response.getWriter(); 
//RequestDispatcher rd = null;
System.out.println(session.getId()); 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(null==session.getAttribute("username"))
{
	PrintWriter outs=response.getWriter();
	 request.getRequestDispatcher("login.jsp").include(request, response);  
		//rd = request.getRequestDispatcher("registration.html");
	    //rd.include(request, response);
	 // response.sendRedirect(request.getContextPath() + "/index.jsp");
		outs.println("<center><font color=red>Please login to continue</font></center>");
		outs.close();
	}
else{
String rno = request.getParameter("rno");
String department=request.getParameter("department");
%><%
//String filename = request.getParameter("filename");
//String generate=request.getParameter("generate"); 
 //supply this uname and pwd to Users
 
StudentPercent student = EntityFactory.getStudent();
//   eligible.setPercent(percent);
 //user.setPassword(password);
 //user.setName("na");
List<StudentPercent> marksList = new ArrayList<StudentPercent>();
List<String> columnList = new ArrayList<String>();
 //pass users obj to DAO ask him to check credentials
 StudentInfo sdao = DAOFactory.getStudentInfo();
 marksList = sdao.getMarksList(rno);
 columnList=sdao.getEligibleColumns(rno);
 int count=0;
 %>
 <tr>
 <%
 for(String str1: columnList){
	 count++;
	 %>
	<th><%= str1 %>
<%
}
 %>
 </th> 
 </tr><%
 for(StudentPercent str: marksList){
	%>
		<tr><td><%= str.getRollNo() %></td><td><%= str.getName()%> 
		</td><td><%= str.getDepartment() %></td><td><%= str.getSem1Percent() %></td><td><%= str.getSem2Percent() %></td>
		<td><%= str.getSem3Percent() %></td><td><%= str.getSem4Percent() %></td><td><%= str.getSem5Percent() %></td>
		<td><%= str.getSem6Percent() %></td>
		<td><%= str.getSem7Percent() %></td>
		<td><%= str.getSem8Percent() %></td><td><%= str.getAggregate() %></td><td><%= str.getBacklogs() %></td>
		</tr>

<%	
System.out.println(str.getRollNo());
}
 
%>  
</table>
 <%

}
%>

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
