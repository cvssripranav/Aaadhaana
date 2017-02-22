<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Kubo | Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  		
		<link rel="stylesheet" type="text/css" href="Kubo.css">

    </head>
    <body>
    
    <%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
    <%
   /* 
   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires", 0); */
	 response.setHeader("Cache-Control","no-cache");
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader ("Expires", 0);

    
    %>
    <div class="container" id="con1">
    		<h3 id="admin-heading" class="col-xs-offset-2"> <span>ANURAG GROUP OF INSTITUTIONS - PLACEMENT CELL</span></h3>
		<div class="row" id="row1">
			<div class="col-xs-7">
			<img src="index_bg.png" id="adminimg"/>
			</div>
		</div>
		
	
	
	<div class="row" id="row2">
					
					<div id="forblur"> </div>
					<form id="Kubo-Form" class="form-horizontal" action="LoginController">
					
					
					
					
					<div class="form-group"> 
						<label for="username" class=" col-xs-offset-3 col-xs-2 control-label"><span>Username</span></label>
					<div class=" col-xs-3">
						  <input type="text" style="height:30px"   class="form-control" name="username"   placeholder="Enter Username">
					</div>
					</div>
					
					
					<div class="form-group">
					
						<label for="password"class="col-xs-offset-3 col-xs-2 control-label"><span>Password</span></label>
						<div class="col-xs-3">
						<input type="password" style="height:30px" class="form-control" name="password"   placeholder="Enter Password">
						</div>
					</div>
														
													
					 <div class="form-group">
						<div class="col-xs-offset-5 col-xs-3">
						  <div class="checkbox">
							<label>
							  <input type="checkbox"><span>Remember me</span>
							</label>
						  </div>
						</div>
				  </div>
				  
				  <div class="form-group">
					<div class="col-xs-offset-3 col-xs-2">
					  <button type="submit" id="admin-button" >Sign in</button>
					</div>
					<div class=" col-xs-4" style="margin-left:60px;">
					  <a href="registrations.jsp" id="admin-button" style="line-height:40px">Register</a>
					</div>
				  </div>
  
				
					</form>
					
			</div>	
			
    
      </div> 
    </body>
</html>
