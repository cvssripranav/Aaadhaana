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
<title>Kubo | Customize</title>
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
        <li><a href="ExCD.html">Excel <i>to</i> Data</a></li>
        <li><a href="requests.jsp">Student Requests</a></li>
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

<div class="container" id="con1" style="height:650px; margin-bottom:170px">
<h3 id="XCDHeading" style="margin-left:550px"><span>Choose Columns</span></h3>

<a href=<%= "\"Eligibles.jsp?percent=" + request.getParameter("percent1") +"&all="+request.getParameter("allDept1")+"&CSE="+request.getParameter("cse1")+"&ECE="+request.getParameter("ece1")+"&EEE="+request.getParameter("eee1")+"&IT="+request.getParameter("it1")+"&MECH="+request.getParameter("mech1")+"&CIVIL="+request.getParameter("civil1")+ "&CHEM="+request.getParameter("chem1")+"&mail="+request.getParameter("mail")+"&semester="+request.getParameter("semester")+"&batch="+request.getParameter("batch")+"&tenth="+request.getParameter("tenth")+"&inter="+request.getParameter("inter")+"&backlogs="+request.getParameter("backlogs")+"\"" %>  id="customize">Customize</a>

<%@ page import ="com.realtimetpo.daos.*"%>
<%@ page import ="com.realtimetpo.entities.*"%>
<%@ page import=" com.realtimetpo.factories.*"%>
<%@ page import=" com.realtimetpo.factories.EntityFactory"%>
<%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
<%@ page import=" java.sql.* " %>
<form action="customizedView.jsp" id="ECGform" style="width:350px">
<div class="form-group" style="margin-left:100px"> 
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
	 
	 List<String> checkList = new ArrayList<String>();
	 //pass users obj to DAO ask him to check credentials
	 EligibilityDao edao = DAOFactory.getEligibleDao();
	 checkList=edao.getOptions();
	 System.out.println(checkList.size());
	 int j=0;
	 for(String str:checkList){
		 ++j;
		 %>
		
		 <div class="checkbox">
				<label><input type="checkbox" name=<%=str%> value=<%=str%>><span><%=str%></span></label>
		</div>
		 
			
	<% }

 }
System.out.println("in"+ request.getParameter("percent"));
%>
</div>
<input type="hidden" name="percents" value=<%=request.getParameter("percent1") %>>
<input type="hidden" name="allDepts" value=<%=request.getParameter("allDept1") %>>
<input type="hidden" name="cseDept" value=<%=request.getParameter("cse1") %>>
<input type="hidden" name="eceDept" value=<%=request.getParameter("ece1") %>>
<input type="hidden" name="eeeDept" value=<%=request.getParameter("eee1") %>>
<input type="hidden" name="itDept" value=<%=request.getParameter("it1") %>>
<input type="hidden" name="mechDept" value=<%=request.getParameter("mech1") %>>
<input type="hidden" name="civDept" value=<%=request.getParameter("civil1") %>>
<input type="hidden" name="chemDept" value=<%=request.getParameter("chem1") %>>
<input type="hidden" name="semester" value=<%=request.getParameter("semester") %>>
<input type="hidden" name="batch" value=<%=request.getParameter("batch") %>>
<input type="hidden" name="tenth" value=<%=request.getParameter("tenth") %>>
<input type="hidden" name="inter" value=<%=request.getParameter("inter") %>>
<input type="hidden" name="backlogs" value=<%=request.getParameter("backlogs") %>>
<div class="form-group" >
		<div class="col-xs-offset-3 col-xs-2">
		  <input type="submit" class="admin-button" id="customsubmit" value="Submit">
		  
		</div>
  </div>

</form>
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