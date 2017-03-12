<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="com.realtimetpo.daos.*"%>
<%@ page import ="com.realtimetpo.entities.*"%>
<%@ page import=" com.realtimetpo.factories.*"%>
<%@page import="com.realtimetpo.daos.EligibilityDao"%>
<%EligibilityDao edao=DAOFactory.getEligibleDao();
List<SubjectModel> subject=new ArrayList<SubjectModel>();
subject=edao.getSubjectList(request.getParameter("department"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Kubo | Notify</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="nav_bar.css"/>
<link rel="stylesheet" type="text/css" href="KuboStudent.css"/> 
  
 <script type="text/javascript">
	
   


var request;  
function sendInfos()  
{  
	alert("hii");
var v=document.notify.subjects.value; 
var id=document.notify.rno.value;
var ids=document.notify.department.value;
var name="<%=session.getAttribute("name")%>";
 

	var url="sendNotification.jsp?sub="+v+"&id="+id+"&dept="+ids+"&name="+name;  
	//?sub="+v+"&id="+id+"&dept="+ids+"&name="+name
   /* var links=v; 
   alert("Result from second.jsp: " + links ); */ 
 if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send(null);  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('op').innerHTML=val;  

}  
 
 } 
</script>
  
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
		<li><a href=<%= "\"StdentDetails.jsp?rno=" + request.getParameter("rno") + "&department="+request.getParameter("department")+"\"" %> id="studentdetails"> My Profile</a></li>
		 <li><a href=<%= "\"StudentSemPerformance.jsp?rno=" + request.getParameter("rno") + "&department="+request.getParameter("department")+"\"" %> id="studentdetails">My Marks</a></li>
        <li><a href="#" style="background-color:white; color:#1e90ff">Notify</a></li>
        <li><a href=<%= "\"RequestStatus.jsp?rno=" + request.getParameter("rno") + "&department="+request.getParameter("department")+"\"" %>  id="semMarks">Request Status</a></li>
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



<div class="container" id="con2">
<h3 id="admin-heading" class="col-xs-offset-3" style="margin-left:400px; margin-top:20px;"> <span>Hey<%=" "+session.getAttribute("name")+", "%>Have a problem with displayed marks?  </span></h3>
<%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
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


 else
 {
String rno=request.getParameter("rno");
String department=request.getParameter("department");

%>
<!-- <a href="attendbydate.jsp" target="f2">REFRESH</a>
<a href="result.jsp" target="f2" style="float: right;">HOME</a><br><br> -->




<form name="notify" class="form-horizontal" id="Regiform"  action="NotifyController" > 

	  <div class="form-group"> 
		<label for="rno" class="col-xs-offset-3 col-xs-2 control-label"><span>Roll No.</span></label>
		<div class="col-xs-3">
			  <input type="text" style="height:30px"  class="form-control" name="rno" id="rno" value=<%=request.getParameter("rno")%> required/>
		</div>
	</div>
	
	<div class="form-group"> 
		<label for="department" class="col-xs-offset-3 col-xs-2 control-label"><span>Department</span></label>
		<div class="col-xs-3">
			  <input type="text" style="height:30px"  class="form-control" name="department" id="department" value=<%=request.getParameter("department")%> required/>
		</div>
	</div>
	
	<div class="form-group"> 
		<label for="batch" class="col-xs-offset-3 col-xs-2 control-label"><span>Batch</span></label>
		<div class="col-xs-3">
			  <input type="text" style="height:30px"  class="form-control" name="batch" id="batch"  required/>
		</div>
	</div>
	
	<div class="form=group">
	<label for="subjects" class="col-xs-offset-3 col-xs-2 control-label"><span>Subjects</span></label>
	<div class="col-xs-3">
		<select class="form-control" name="subjects" id="subjects" style="height:30px;">
			<%
			for(SubjectModel str:subject)
			{
			%>
		<option value=<%=str.getSucode() %>-<%=str.getSuname() %>><%=str.getSucode() %>-<%=str.getSuname() %></option>
			<%} %>
			
		</select>
		</div>
	</div>
	

	 <div class="form-group" style="margin-left:-10px">
		<div class="col-xs-offset-5 col-xs-1" >
		 <input type="button" name="send"  class="admin-button"  id="send" value="AddSubject" onClick="sendInfos()">
		</div>
		
		<div class="col-xs-2" style="margin-left:50px">
		 <input type="reset" name="reset" class="admin-button" value="Reset" id="reset">
		</div>
    </div> 








</form>
</div>


<%
}
%>
 <footer>
	<p>	Anurag Group of Institutions- Centralized Placement Web Application<br>
		 E-mail:cvsrit13@gmail.com<br>
		 &copy;All rights reserved, Department of Information Technology
		 <br>2013-2017
	 </p>
</footer>
</body>
</html>
