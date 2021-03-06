<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html lang="en">
 <head>
	<meta charset="utf-8">
	<title>Kubo | XCD</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="nav_bar.css">
<link rel="stylesheet" type="text/css" href="XCD.css">

<script>
	$(document).ready(function() {// When HTML DOM is ready it will execute the following function...
		$('#queryButton').on('click', function() {
			
			var subranch = $("#subranch").val();
			var susem = $("#susem").val();
			var subatch = $("#subatch").val();
			
			
			var params = {
				    subranch: "",
				    susem: "",
				    subatch: ""
				};
			params.subranch=subranch;
			params.susem=susem;
			params.subatch=subatch;
			console.log(params.subatch);
		
			$.get("SemMarksEntry", $.param(params), function(responseJson) {
				
				 /*var $ul = $("<ul>").appendTo($("#subul")); // Create HTML <ul> element and append it to HTML DOM element with ID "somediv".
			     $.each(responseJson, function(index, item) { // Iterate over the JSON array.
			         $("<li>").text(item).appendTo($ul);      // Create HTML <li> element, set its text content with currently iterated item and append it to the <ul>.
			     });*/
				 
			     $.each(responseJson, function(index, item) {
			         
			             $('<td>').text(item).appendTo('#subtr');
			             
			     });
			     $(".suborderwarn").html("Please see that the subject marks are in the following order");
			     
				 
			    // ...
			   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
    	/*var $select = $("#mesa");                           // Locate HTML DOM element with ID "someselect".
        $select.find("option").remove();                          // Find all child elements with tag name "option" and remove them (just to prevent duplicate options when button is pressed again).
        $.each(responseJson, function(index, item) {               // Iterate over the JSON object.
         $("<option>").val(item).text(item).appendTo($select); // Create HTML <option> element, set its value with currently iterated key and its text content with currently iterated item and finally append it to the <select>.
        });*/
    });
});
	});	
	
	
	
	
	
	
  </script>
  
  <style>
  body
  {
   background-color:white;
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
        <li ><a href="ExCD.jsp" style="background-color:white; color:#1e90ff" >Excel <i>to</i> Data</a></li>
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

 
 
 
	<div class="container" id="con1">
		<h3 id="XCDHeading" style="margin-left:480px"><span>Excel To Data Conversion</span></h3>
		<%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
<%response.setContentType("text/html");  
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
else{ %>
		
		<form id="XCDTform" class="form-horizontal" method="post" action="XCDTest" enctype="multipart/form-data">
									
				
					<div class="form-group">
						<label for="uploadFile" class="col-xs-offset-2 col-xs-3 control-label"><span>File Upload</span></label>
						<div class="col-xs-3">
							
						<input type="file" style="height:30px" id="vid" class="form-control" name="uploadFile" required />
                        						
						</div>
					</div>
					
					
					
					<div class="form-group">
						<label for="subranch" class="col-xs-offset-3 col-xs-2 control-label"><span>Branch</span></label>
						<div class="col-xs-3">
							<input type="text" style="height:30px" id="subranch" class="form-control" name="subranch" required/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="susem" class="col-xs-offset-3 col-xs-2 control-label"><span>Semester</span></label>
						<div class="col-xs-3">
							<input type="text" style="height:30px" id="susem" class="form-control" name="susem" required/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="subatch" class="col-xs-offset-3 col-xs-2 control-label"><span>Batch</span></label>
						<div class="col-xs-3">
							<input type="text" style="height:30px" id="subatch" class="form-control" name="subatch" required/>
						</div>
					</div>
					
					
					
								
			 <div class="form-group" style="margin-top:30px;margin-left:-40px;">
				<div class="col-xs-offset-5">
				<button type="submit" value="Upload" id="admin-button" >Submit</button>
				</div>
			</div>
		</form>
		
		<div class="col-xs-offset-5" style="margin-left:590px">
				
				<form onsubmit="return false"><button type="submit"  class="format" id="queryButton" >Get Format</button> </form>
				</div>
		
		
	</div>
	
	<div class="container" id="con2">
	
	<h2 id="weltxt" class="suborderwarn"></h2>
	<h2 id="weltxt">${requestScope.message}</h2>
	<table align="center" class="table table-striped" cellpadding="4" cellspacing="4"><tr id="subtr"></tr></table>
	
	<ul id="subul"></ul>
	
	</div>
	

<%} %>	
	<footer>
		<p>	Anurag Group of Institutions- Centralized Placement Web Application<br>
			 E-mail:cvsrit13@gmail.com<br>
			 &copy;All rights reserved, Department of Information Technology
			 <br>2013-2017
		 </p>
	</footer>
</body>

</html>	