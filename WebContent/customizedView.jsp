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
<title>Kubo | Customized View</title>
<style>
table {
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
			
		
          </ul>
        </li>-->
      </ul>
      
    </div>
  </div>
</nav>

	<div class="container" id="con1">
	
<%@ page import ="com.realtimetpo.daos.*"%>
<%@ page import ="com.realtimetpo.entities.*"%>
<%@ page import=" com.realtimetpo.factories.*"%>
<%@ page import=" com.realtimetpo.factories.EntityFactory"%>
<%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
<%@ page import=" java.sql.* " %>
<table align="center" class="table table-striped" cellpadding="4" cellspacing="4" id="eligibles">
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
	 String percent=request.getParameter("percents");
	 String allDept2=request.getParameter("allDepts");
	 String cse2=request.getParameter("cseDept");
	 String ece2=request.getParameter("eceDept");
	 String eee2=request.getParameter("eeeDept");
	 String it2=request.getParameter("itDept");
	 String mech2=request.getParameter("mechDept");
	 String civil2=request.getParameter("civDept");
	 String chem2=request.getParameter("chemDept");
	 String semester=request.getParameter("semester");
	 String batch=request.getParameter("batch");
	 String tenth=request.getParameter("tenth");
	 String inter=request.getParameter("inter");
	 String backlogs=request.getParameter("backlogs");
	 //String filename = request.getParameter("filename");
	 //String generate=request.getParameter("generate"); 

System.out.println("in2"+percent);
	 List<String> check = new ArrayList<String>();
	 List<String> checks = new ArrayList<String>();
	 List<Eligibility> eligibles=new ArrayList<Eligibility>();
	 //pass users obj to DAO ask him to check credentials
	 EligibilityDao edao = DAOFactory.getEligibleDao();
	 check=edao.getOptions();
	 System.out.println(check.size());
	 int j=0;%>
	 <tr>
	<% for(String str:check){
		 ++j;
		 
		 if (request.getParameter(str)!=null){
		 checks.add(request.getParameter(str));%>
		 <td><%=str %></td>
	<% }}%>
	</tr><%	 int k=0;
eligibles=edao.getCustomizedEligibles(checks,percent,allDept2,cse2,ece2,eee2,it2,mech2,civil2,chem2,semester,batch,tenth,inter,backlogs);
System.out.println("hiifi"+eligibles.size());
int i1=0,i2=0,i3=0,i4=0,i5=0,i6=0,i7=0,i8=0,i9=0,i10=0,i11=0,i12=0,i13=0,i14=0,i15=0,i16=0,i17=0,i18=0,i19=0;
for(Eligibility str1: eligibles){
	%><tr>
	<%for(String str2:checks){%>
		
	<%	if(str2.equalsIgnoreCase("RollNo")&& i1<1){++i1;
	%>
		<td><%= str1.getRollNo() %></td> 
	<%	
	}if(str2.equalsIgnoreCase("Name")&& i2<1){++i2; %>
		<td><%= str1.getName() %></td>
		<%	}if(str2.equalsIgnoreCase("Department")&& i3<1){++i3; %>
		<td><%= str1.getDepartment() %></td>
		<%	}if(str2.equalsIgnoreCase("EmailID")&& i4<1){++i4; %>
		<td><%= str1.getEmailid() %></td>
		<%	}if(str2.equalsIgnoreCase("Phone")&& i5<1){++i5; %>
		<td><%= str1.getPhone() %></td>
		<%	}if(str2.equalsIgnoreCase("Tenth")&& i6<1){++i6; %>
		<td><%= str1.getTenth() %></td>
		<%	}if(str2.equalsIgnoreCase("Intermediate")&& i7<1){++i7; %>
		<td><%= str1.getIntermediate() %></td>
		<%	}if(str2.equalsIgnoreCase("Sem1percent")&& i8<1){++i8; %>
		<td><%= str1.getSem1Percent() %></td>
		<%	}if(str2.equalsIgnoreCase("Sem2percent")&& i9<1){++i9; %>
		<td><%= str1.getSem2Percent() %></td>
		<%	}if(str2.equalsIgnoreCase("Sem3percent")&& i10<1){++i10; %>
		<td><%= str1.getSem3Percent() %></td>
		<%	}if(str2.equalsIgnoreCase("Sem4percent")&& i11<1){++i11; %>
		<td><%= str1.getSem4Percent() %></td>
		<%	}if(str2.equalsIgnoreCase("Sem5percent")&& i12<1){++i12; %>
		<td><%= str1.getSem5Percent() %></td>
		<%	}if(str2.equalsIgnoreCase("Sem6percent")&& i13<1){++i13; %>
		<td><%= str1.getSem6Percent() %></td>
		<%	}if(str2.equalsIgnoreCase("Sem7percent")&& i14<1){++i14; %>
		<td><%= str1.getSem7Percent() %></td>
		<%	}if(str2.equalsIgnoreCase("Sem8percent")&& i15<1){++i15; %>
		<td><%= str1.getSem8Percent() %></td>
		<%	}if(str2.equalsIgnoreCase("Aggregate")&& i16<1){++i16; %>
		<td><%= str1.getAggregate() %></td>
		<%	}if(str2.equalsIgnoreCase("Backlogs")&& i17<1){++i17; %>
		<td><%= str1.getBacklogs()%></td>
		<%	}if(str2.equalsIgnoreCase("SemesterCompleted")&& i18<1){++i18; %>
		<td><%= str1.getSemesterCompleted() %></td>
		<%}	if(str2.equalsIgnoreCase("StudentBatch")&& i19<1){++i19; %>
		<td><%= str1.getStudentBatch() %></td>
		
		<%	
//System.out.println("hii" + str1.getId());
		}}i1=0;i2=0;i3=0;i4=0;i5=0;i6=0;i7=0;i8=0;i9=0;i10=0;i11=0;i12=0;i13=0;i14=0;i15=0;i16=0;i17=0;i18=0;i19=0;
	%></tr>
	<%
	

 }
 }
%>
</table>
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