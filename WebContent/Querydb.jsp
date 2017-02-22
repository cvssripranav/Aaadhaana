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
  
  <script type="text/javascript">

  
	$(document).ready(function() {
				
		$.get("MesaNombres", function(responseJson) {    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
	    	var $select = $("#mesa");                           // Locate HTML DOM element with ID "someselect".
	                               // Find all child elements with tag name "option" and remove them (just to prevent duplicate options when button is pressed again).
	        $.each(responseJson, function(index, item) {               // Iterate over the JSON object.
	         $("<option>").val(item).text(item).appendTo($select); // Create HTML <option> element, set its value with currently iterated key and its text content with currently iterated item and finally append it to the <select>.
	        });
	    });
		
		
		
		$('#queryButton').on('click', function() {
	     	
		var opt2 =  $("#mesa option:selected").val();
		
		if(opt2=='student')
			{
			$('#StudentTableContainer').jtable('load', {
				pkey: $('#pk').val()
								
				
			});
			
			}
		else
			{
			
			if(opt2=='marks')
			{
				$('#MarksTableContainer').jtable('load', {
					pkey: $('#pk').val()
					
					
				});
			}
			
			else
				{
					$('#SubjectTableContainer').jtable('load', {
						pkey: $('#pk').val()
						
						
					});
								
				}
						
			}
			
			
			
	});
		
		
		
		$(document).on('change', 'select', function() {
		    
		    var opt = $(this).val();
		    
		     

			var $fields;
			var $actions;
			
			
			var studentf={
					sroll : {
						title : 'sroll',
						width : '20%',
						key : true,
						list : true,
						edit : false,
						create : true
					},
					sname : {
						title : 'sname',
						width : '20%',
						edit : true
					},
					sbranch : {
						title : 'sbranch',
						width : '10%',
						edit : true
					},
					sphone : {
						title : 'sphone',
						width : '20%',
						edit : true
					},
					
					smail : {
						title : 'smail',
						width : '20%',
						edit : true
					},
					
					semdone: {
						title : 'semdone',
						width : '10%',
						edit : true
					}
					
			}
			
			var studenta = {
					listAction : 'JTableController?action=list',
					createAction : 'JTableController?action=create',
					updateAction : 'JTableController?action=update',
					deleteAction : 'JTableController?action=delete'
						}
			
			var marksf={
					
					mroll : {
						title : 'Roll',
						width : '25%',
						key : true,
						list : true,
						edit : false,
						create : true
					},
					mscode : {
						title : 'Sub Code',
						width : '25%',
						edit : true
					},
					mmarks : {
						title : 'Marks',
						width : '25%',
						edit : true
					},
					mpof : {
						title : 'Pass/ Fail',
						width : '25%',
						edit : true
					}
					
			}
			var marksa = {
					listAction : 'MarksJTableController?action=markslist',
					createAction : 'MarksJTableController?action=markscreate',
					updateAction : 'MarksJTableController?action=marksupdate',
					deleteAction : 'MarksJTableController?action=marksdelete'
						}
			
			var subjectsf = {
					
					sucode : {
						title : 'Sub Code',
						width : '25%',
						key : true,
						list : true,
						edit : false,
						create : true
					},
					suname : {
						title : 'Sub Name',
						width : '25%',
						edit : true
					},
					subranch : {
						title : 'Sub Branch',
						width : '25%',
						edit : true
					},
					susem : {
						title : 'Sub Sem',
						width : '5%',
						edit : true
					},
					
					sumarks : {
						title : 'Sub Marks',
						width : '5%',
						edit : true
					}
					
					
			}
			
			var subjectsa = {
					
					listAction : 'SubjectJTableController?action=subjectlist',
					createAction : 'SubjetctJTableController?action=subjectcreate',
					updateAction : 'SubjectJTableController?action=subjectupdate',
					deleteAction : 'SubjectJTableController?action=subjectdelete'
					
			}
			
			if(opt==='marks')
				{
				console.log("marks"); 
				$fields = marksf;
				$actions = marksa; 
				
							
				 $("#StudentTableContainer").hide(1000);
				$("#SubjectTableContainer").hide(1000);
				 $("#MarksTableContainer").show(1000);
				
			    
				$('#MarksTableContainer').jtable({
					title : 'Dyanamic Table',
					actions : $actions,
					fields : $fields
						
					
				});
				
								
				$('#MarksTableContainer').jtable('reload');
			
				
				}
			else 
				{
				
					if(opt=='student')
					{
					console.log("student"); 
					$fields = studentf;
					$actions = studenta; 
					
					
					
					$("#MarksTableContainer").hide(1000);
					$("#SubjectTableContainer").hide(1000);
					 $("#StudentTableContainer").show(1000);
					
					$('#StudentTableContainer').jtable({
						title : 'Dyanamic Table',
						actions : $actions,
						fields : $fields
							
						
					});
					
									
					$('#StudentTableContainer').jtable('reload');
	
					
					}
					
					else
						{
						
						console.log("student"); 
						$fields = subjectsf;
						$actions = subjectsa; 
						
						
						
						$("#MarksTableContainer").hide(1000);
						$("#StudentTableContainer").hide(1000);
						 $("#SubjectTableContainer").show(1000);
						
						$('#SubjectTableContainer').jtable({
							title : 'Dyanamic Table',
							actions : $actions,
							fields : $fields
								
							
						});
						
						$('#SubjectTableContainer').jtable('reload');
						
						
						}
				}
			
			
				
	
		    
		});
		
		
		
		
		
		
		
		
	});
		
		
	
	
		
		
	
</script>

 </head>
 <%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
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
        <li ><a href="ExCD.jsp">Excel <i>to</i> Data</a></li>
        <li><a href="#">Notification Issuer</a></li>
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
 
 
	 <div class="container" id="con1">
		<h3 id="XCDHeading"  style="margin-left:580px"> <span>Query Database</span></h3>
		
	
	
	
					<form id="XCDform" class="form-horizontal" onsubmit="return false" >
					
					<div class="form-group">
						<label for="tablename"class="col-xs-offset-3 col-xs-2 control-label"><span>Table</span></label>
						<div class="col-xs-3">
							<select class="form-control" name="tablename" id="mesa" style="height:30px;">
							
								
							</select>
						</div>
					</div>
					
					
					<div class="form-group" id="queryJTable"> 
						<label for="pkey" class=" col-xs-offset-3 col-xs-2 control-label"><span>Filter</span></label>
					<div class=" col-xs-3">
						  <input type="text" style="height:30px"  id="pk" class="form-control" name="pkey"   placeholder="Enter Pkey">
					</div>
					</div>
					
					
					
					<div class="form-group" style="margin-top:30px;margin-left:50px">
				<div class="col-xs-offset-4 col-xs-2">
				<input type="button" id="queryButton" value="Query"/>
				</div>
					</div>
					
					</form>
					
						</div>	
					
		
<div class="container" id="con2">
	<div style="width: 80%; margin-right: 10%; margin-left: 10%;margin-bottom: 5%; text-align: center;">
	<div id="StudentTableContainer"></div>
	</div>
	
	<div style="width: 80%; margin-right: 10%;  margin-left: 10%;margin-bottom: 5%; text-align: center;">
	
	<div id="SubjectTableContainer"></div>
	</div>
	
	<div style="width: 80%; margin-right: 10%; margin-left: 10%; margin-bottom: 5%; text-align: center;">
	
	<div id="MarksTableContainer"></div>
	</div>
	
</div>
	<%} %>
	
	<footer>
		<p>	Kubo - Centralized Placement Web Application<br>
			 E-mail:cvsrit13@gmail.com<br>
			 &copy;All rights reserved, Department of Information Technology
			 <br>2013-2017
		 </p>
	</footer>
	
</body>
</html>	