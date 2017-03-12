<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html lang="en">
 <head>
	<meta charset="utf-8">
	<title>Kubo | QueryDB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">



<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!-- Include jTable script file. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

  

<link rel="stylesheet" type="text/css" href="nav_bar.css">
<link rel="stylesheet" type="text/css" href="XCD.css">
<style>
#queryButton {
    display:block;
    width:100px;
	height:40px;
	position:relative;
	margin-left:20px;
	margin-top:20px;
    line-height:20px;
    color:white;
    text-align:center;
    text-decoration:none;
	text-shadow: 0 0 1px #1e90ff;
    background-color: #1e90ff;
    font-size:1em;
   	font-family:ps;	
	transition-duration:2s;
	transition-property:height,width,color,text-shadow,font-size,text-shadow,background-color,line-height,box-shadow;
	border:none;
	
}
#queryButton :hover {
	text-align:center;
	text-decoration:none;
	/*box-shadow: 0 0 5px black;*/	
	color:#1e90ff;
	background-color:white;
	border:none;
	
}

</style>
  <script>
function myfunction(divName) {
	   var printContents = document.getElementById(divName).innerHTML;
	     var originalContents = document.body.innerHTML;

	     document.body.innerHTML = printContents;

	     window.print();

	     document.body.innerHTML = originalContents;}
	     </script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#RequestContainer').jtable({
			title : 'Requests',
			actions : {
				listAction : 'RequestController?action=list',
				updateAction : 'RequestController?action=update',
				deleteAction : 'RequestController?action=delete'
			},
			fields : {
				rollId :{
					title : 'Roll',
					width : '20%',
				     edit : false,
				     create:false,
				     
					 clientOnly: false
					
				},
			name : {
					title : 'Name',
					width : '20%',
			         list : true,
					edit : false,
					 clientOnly: false
					
				},
				branch : {
					title : 'Branch',
					width : '10%',
					 clientOnly: false,
					edit : false
				},
				subjects : {
					title : 'Subject',
					width : '20%',
					 edit : false,
				     create:false,
				     
					 clientOnly: false
					
				},
				batch : {
					title : 'Batch',
					width : '10%',
					 clientOnly: false,
					edit : false
				},
			status :{
					title : 'Status',
					width : '20%',
					 clientOnly: false,
					edit : true
				}
						
			}
			
		});
		
	
		$('#RequestContainer').jtable('load');
		 $("input[name='btn']").click(function() {
             $("#ok").load("Delete.jsp");
         });
				
			});
		
		 
		 
		 
		  
		
 </script>

 </head>
 <%-- <%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
<% response.setContentType("text/html");  
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
		outs.println("<center><font color=red >Please login to continue</font></center>");
		outs.close();
	}
else{ %>
 --%> <body>
 
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
		<li><a href="trytpo.jsp">EC Generator</a></li>
        <li ><a href="ExCD.jsp">Excel <i>to</i> Data</a></li>
        <li><a href="requests.jsp">Student Requests</a></li>
		<li><a href="Querydb.jsp" style="background-color:white; color:#1e90ff">Query DB</a></li>
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
 
 

					
		
<div class="container" id="con2" style="margin-top:60px">
<h3 id="XCDHeading"  style="margin-left:550px"> <span>Requests from Students</span></h3>
	<div style="width: 80%; margin-right: 0%; margin-left: 10%; text-align: center;" id="printarea">

		<div id="RequestContainer">
		<div id="ok" style="width: 60%; margin-right: 10%; margin-left: 77%; text-align: center;" class="content" >
	
	<input type="button"  name="btn" id="delete" style="margin-right: 35%;"    value="Delete" class="deleting"/></button>
		 </div></div>
		 <input type="button"  id="export" value="Print" onClick="myfunction('printarea')"/></button><br>
		 
	
		
		</div>
	
</div>
	<%-- <%} %> --%>
	
	<footer>
		<p>	Anurag Group of Institutions- Centralized Placement Web Application<br>
			 E-mail:cvsrit13@gmail.com<br>
			 &copy;All rights reserved, Department of Information Technology
			 <br>2013-2017
		 </p>
	</footer>
	
</body>
</html>	