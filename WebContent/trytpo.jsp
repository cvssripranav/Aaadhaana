<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Kubo | EC Gen</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" type="text/css" href="nav_bar.css"/>
<link rel="stylesheet" type="text/css" href="ECG.css"/> 




  
 <script>
 
 function addInput()
 {

	 
		    $('#mail').load('inbox.jsp');
		
        
}
 </script> 
  <script>
            $(document).ready(function() {
                $('#radioButton').click(function() {
                   // alert($('#columnData').html());
                    var name = $('#percent').html();             
                    $.post("MailingController", {'name': name}, 
                    	       function(data) 
                    	       { 
                    	          alert("Result from second.jsp: " + data.name + " " + data.type); 
                    	       }
                    	);              
                });
               
            });
          /*  function inactive()
{
            	var generate=$("#generate").val();
            	alert(generate)
            	if(generate.match("no"))
            		{
            	$("#filename").prop("disabled","disabled");
            		}
            	           	
            	}          
            function active()
            {
                        	var generate=$("#generates").val();
                        	alert(generate)
                        	if(generate.match("yes"))
                        		{
                        	           		$("#filename").removeProp("disabled");	
                        	}    }      
            
            */
            
            $(document).ready(function() {
                $('#generate').click(function() {
                	$("#filename").prop("disabled","disabled");
                   // alert($('#columnData').html());
                               
                });
                $('#generates').click(function() {
                	$("#filename").removeProp("disabled");
                   // alert($('#columnData').html());
                               
                });
               
            });
           
            $(document).ready(function() {
                $('#all').click(function() {
                	 
                   // alert($('#columnData').html());
                	if($(this).prop("checked") == true){
                		$("#cse").prop("disabled","disabled");
                    	$("#ece").prop("disabled","disabled");
                    	$("#eee").prop("disabled","disabled");
                    	$("#it").prop("disabled","disabled");
                    	$("#civil").prop("disabled","disabled");
                    	$("#mech").prop("disabled","disabled");
                    	$("#chem").prop("disabled","disabled");
                       
                    }
                    else if($(this).prop("checked") == false){
                    	$("#cse").removeProp("disabled");
                    	$("#ece").removeProp("disabled");
                    	$("#eee").removeProp("disabled");
                    	$("#it").removeProp("disabled");
                    	$("#civil").removeProp("disabled");
                    	$("#mech").removeProp("disabled");
                    	$("#chem").removeProp("disabled");
                       
                    } 
                	
                });
               //  $('#all').click(function() {

                	// alert($('#columnData').html());
                               
               });
            
        </script>
        <script>$(document).ready(function() {
       	 $('#generate').click(function() {
             // alert($('#columnData').html());
              var filename = $('#filename').html();             
              $.post("download.jsp", {'filename': filename}, 
              	       function(data) 
              	       { 
              	          alert("Result from second.jsp: " + data.filename + " " + data.type); 
              	       }
              	);              
          });
    });</script>
  
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
<h3 id="XCDHeading" style="margin-left:480px"><span>Eligibility List Generator</span></h3>
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

					
<form name="searchbydate" id="ECGform" class="form-horizontal" action="Eligibles.jsp"> 

	<div class="form-group"> 
		<label for="percent" class="col-xs-offset-3 col-xs-2 control-label"><span>Enter B.Tech %</span></label>
		<div class=" col-xs-3">
			 <input type="text" class="form-control" name="percent" id="percent" placeholder="Enter B.Tech percentage"  required> 
		</div>
	</div>
	
	<div class="form-group"> 
		
		<div class="checkbox-inline" style="margin-left:160px">
		<label class="col-xs-offset-1 col-xs-1 control-label"><span>Departments</span></label>
		</div>
		
		
			<div class="checkbox-inline">
				<label  for="all" class=" col-xs-1 control-label"><input type="checkbox" id="all" name="all" ><span>All</span></label>
			</div>
		
		
		
			<div class="checkbox-inline" class="col-xs-offset-1 col-xs-3">
				<label  for="CSE" class="col-xs-1 control-label"><input type="checkbox" class="dept1" id="cse" name="CSE" value="CSE"><span>CSE</span></label>
			</div>
			
			<div class="checkbox-inline">
				<label  for="ECE" class="col-xs-1 control-label"><input class="dept1"type="checkbox" id="ece" name="ECE" value="ECE" ><span>ECE</span></label>
			</div>
			
			<div class="checkbox-inline">
				<label  for="EEE" class="col-xs-1 control-label"><input class="dept1"type="checkbox" id="eee" name="EEE" value="EEE" ><span>EEE</span></label>
			</div>
			
			<div class="checkbox-inline">
				<label  for="IT" class="col-xs-1 control-label"><input class="dept1" type="checkbox" id="it" name="IT" value="IT"><span>IT</span></label>
			</div>
		
			<div class="checkbox-inline">
				<label  for="CIVIL" class="col-xs-1 control-label"><input class="dept1" type="checkbox" id="civil" name="CIVIL" value="CIV" ><span>CIVIL</span></label>
			</div>
			
			<div class="checkbox-inline">
				<label  for="MECH" class="col-xs-1 control-label"><input class="dept1"type="checkbox" id="mech" name="MECH" value="MECH"><span>MECH</span></label>
			</div>
			
			<div class="checkbox-inline">
				<label  for="CHEM" class="col-xs-1 control-label"><input class="dept1"type="checkbox" id="chem" name="CHEM" value="CHEM"><span>CHEM</span></label>
			</div>
			
			
		</div>

		






<!-- Generate Excel::<input type="radio" name="generate" id="generates" value="yes" required onClick="active()">yes &emsp;
<input type="radio" name="generate" id="generate" value="no" onClick="inactive()">NO &emsp;<br>
Enter File Name:<input type="text" name="filename" id="filename" required><br>
 -->
		<div class="form-group">
			<label for="semester" class="col-xs-offset-3 col-xs-2 control-label"><span>Semester</span></label>
				<div class="col-xs-3">
					<select class="form-control" name="semester" style="height:30px;">
						<option  value="1">1</option>
						<option value="2">2</option>
						<option  value="3">3</option>
						<option  value="4">4</option>
						<option value="5">5</option>
						<option  value="6">6</option>
						<option  value="7">7</option>
						<option  value="8">8</option>	
								
					</select>
				</div>
		</div>
					
		

		<div class="form-group">
			<label for="batch" class="col-xs-offset-3 col-xs-2 control-label"><span>Batch</span></label>
				<div class="col-xs-3">
					<select class="form-control" name="batch" style="height:30px;">
						<option  value="2012">2012</option>
						<option value="2013">2013</option>
							
								
					</select>
				</div>
		</div>
 
 <!--Batch:<input type="text" name="batch" value="batch"><br>-->
 
	<div class="form-group"> 
		<label for="tenth" class=" col-xs-offset-3 col-xs-2 control-label"><span>10th Percent</span> </label>
			<div class=" col-xs-3">
				  <input type="text" style="height:30px" class="form-control" name="tenth" placeholder="Enter 10th percentage" required>
			</div>
	</div>
	
	<div class="form-group"> 
		<label for="inter" class=" col-xs-offset-3 col-xs-2 control-label"><span>Intermediate</span></label>
			<div class=" col-xs-3">
				  <input type="text" style="height:30px" class="form-control" name="inter" placeholder="Enter Inter percentage" required>
			</div>
	</div>
	
	<div class="form-group"> 
		<label for="backlogs" class=" col-xs-offset-3 col-xs-2 control-label"><span>Backlogs</span></label>
			<div class=" col-xs-3">
				  <input type="text" style="height:30px" class="form-control" name="backlogs" placeholder="Enter number of backlogs" required>
			</div>
	</div>
	
	<div class="form-group"> 
			<label for="mail" class=" col-xs-offset-3 col-xs-2 control-label"><span>Send Mail</span>
			</label>
			<label class="radio-inline" style="margin-left:20px" >
					<input type="radio" name="mail" id="radiobutton" value="yes"><span>Yes</span>
			</label>	
			<label class="radio-inline" style="margin-left:20px" >
				<input type="radio" name="mail" id="radiobutton" value="no"><span>No</span>
			</label>
	</div>
	


	<div class="form-group" style="margin-left:50px">
		<div class="col-xs-offset-5 col-xs-2">
		<input class="admin-button" type="submit" name="submit" value="Search" id="serch"> 
		</div>
	</div>



</form>



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
