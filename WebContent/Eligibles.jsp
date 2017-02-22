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
<link rel="stylesheet" type="text/css" href="ECG.css"/> 

<script data-main="js/app" src="js/lib/require.js"></script>
<title>Kubo | Eligibility Generator</title>
 <script>
 
 function addInput()
 {
	 <% String percents=request.getParameter("percent");%>
var percent="<%=percents%>";
	 
		    $('#mail').load('inbox.jsp?percent='+percent);
		
        
}
 </script> 

   <!--<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">   
   <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>-->
  
  <style>
  	table
  	{
  		background-color:white!important;
  	}
  </style>
  

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
	  
        <li><a href="KuboHome.jsp" >Home</a></li>
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
		<li><a href="trytpo.jsp" style="background-color:white; color:#1e90ff">EC Generator</a></li>
        <li><a href="ExCD.jsp">Excel <i>to</i> Data</a></li>
        <li><a href="#">Notification Issuer</a></li>
		<li><a href="Querydb.jsp">Query DB</a></li>
		<li><a href="#">SQL Log</a></li>
		<li><a href="#">Blog</a></li>
		<li><a href="Logout" id="logout">Logout</a></li>
		<!-- <li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">REGISTER<span class="caret"></span></a>
          <ul class="dropdown-menu">
            
            <li><a href="events.html">Tech Zone</a></li>
            <li><a href="common.html">Open Zone</a></li>
			<li><a href="skill.html">Skill Zone </a></li>
			
		
          </ul>-->
        </li>
      </ul>
      
    </div>
  </div>
</nav>

	<div class="container" id="con1">
		
		
		<table align="center" class="table table-striped" cellpadding="4" cellspacing="4" id="eligibles">
		<tr></tr>
		<tr bgcolor="skyblue">
		<!--  <th><b>Name</b></th>
		<th><b>Role</b></th>
		<th><b>Branch</b></th>
		<th><b>Percentage</b></th>
		<th><b>Backlogs</b></th>-->


		</tr>
	

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
<%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
<%@ page import=" java.sql.* " %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
 
 if(null==session.getAttribute("username"))
{
	 response.setContentType("text/html"); 
	PrintWriter outs=response.getWriter();
	 request.getRequestDispatcher("login.jsp").include(request, response);  
		//rd = request.getRequestDispatcher("registration.html");
	    //rd.include(request, response);
	 // response.sendRedirect(request.getContextPath() + "/index.jsp");
		outs.println("<center><font color=red>Please login to continue</font></center>");
		outs.close();
	}
 else{


String percent = request.getParameter("percent");
int semester=Integer.parseInt(request.getParameter("semester"));
int batch=Integer.parseInt(request.getParameter("batch"));
float tenth=Float.parseFloat(request.getParameter("tenth"));
float inter=Float.parseFloat(request.getParameter("inter"));
int backlogs=Integer.parseInt(request.getParameter("backlogs"));
String allDept=request.getParameter("all");
String cse=request.getParameter("CSE");
String ece=request.getParameter("ECE");
String eee=request.getParameter("EEE");
String it=request.getParameter("IT");
String mech=request.getParameter("MECH");
String civil=request.getParameter("CIVIL");
String chem=request.getParameter("CHEM");
String filename = request.getParameter("filename");
String generate=request.getParameter("generate"); 
 //supply this uname and pwd to Users
 
Eligibility eligible = EntityFactory.getEligible();
//   eligible.setPercent(percent);
 //user.setPassword(password);
 //user.setName("na");
List<Eligibility> userList = new ArrayList<Eligibility>();
List<String> columnList = new ArrayList<String>();
 //pass users obj to DAO ask him to check credentials
 EligibilityDao edao = DAOFactory.getEligibleDao();
 userList = edao.getEligibleList(percent,allDept,cse,ece,eee,it,mech,civil,chem,semester,batch,tenth,inter,backlogs);
 columnList=edao.getEligibleColumns(percent,allDept,cse,ece,eee,it,mech,civil,chem,semester,batch,tenth,inter,backlogs);
 int count=0;
 %>
 <tr>
 <%
 for(String str1: columnList){
	 count++;
	 if(str1.equalsIgnoreCase("RollNo")||str1.equalsIgnoreCase("Name")||str1.equalsIgnoreCase("Department")
||str1.equalsIgnoreCase("EmailId")||str1.equalsIgnoreCase("Phone")||str1.equalsIgnoreCase("Tenth")||str1.equalsIgnoreCase("Intermediate")||str1.equalsIgnoreCase("Aggregate")
||str1.equalsIgnoreCase("Backlogs")||str1.equalsIgnoreCase("StudentBatch")){
	 %>
	<th><%= str1 %>
<%
}}
 %>
 </th> 
 </tr><%
 for(Eligibility str: userList){
	%>
		<tr><td><%= str.getRollNo() %></td><td><%= str.getName()%> </td><td><%= str.getDepartment() %></td>
		<td><%= str.getEmailid() %></td><td><%= str.getPhone() %></td><td><%= str.getTenth() %></td>
		<td><%= str.getIntermediate() %></td><td><%= str.getAggregate() %></td><td><%= str.getBacklogs() %></td>
		<td><%= str.getStudentBatch()%></td>
		</tr>

<%		
}
 /* if(generate.equalsIgnoreCase("yes"))
 {
	 edao.generateEligibleList(percent, filename);
 }
 */%>  
</table>
<div class="row" style="margin-bottom:5px">
<div class="col-xs-offset-4	 col-xs-2">
	<a href=<%= "\"customize.jsp?percent1=" + request.getParameter("percent") +"&allDept1="+request.getParameter("all")+"&cse1="+request.getParameter("CSE")+"&ece1="+request.getParameter("ECE")+"&eee1="+request.getParameter("EEE")+"&it1="+request.getParameter("IT")+"&mech1="+request.getParameter("MECH")+"&civil1="+request.getParameter("CIVIL")+ "&chem1="+request.getParameter("CHEM")+"&chem1="+request.getParameter("CHEM")+"&semester="+request.getParameter("semester")+"&batch="+request.getParameter("batch")+"&tenth="+request.getParameter("tenth")+"&inter="+request.getParameter("inter")+"&backlogs="+request.getParameter("backlogs")+"&mail="+request.getParameter("mail")+"\"" %> class="admin-button" style="line-height:40px" id="customize">Customize</a>
 </div>
 

 <%
// edao.emptys();
if(request.getParameter("mail").equalsIgnoreCase("yes"))
{
	  
%>

<div class=" col-xs-2">
	  <input type="button" class="admin-button" name="send" value="Mail" onClick="addInput()"><br><br><br>  

 </div>
 </div>
 
 </div>
<!--<a href="inbox.jsp" onClick="addInput()">send</a>-->
<div id="mail"></div>
<%
}
%>

 
<%} %>  

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
