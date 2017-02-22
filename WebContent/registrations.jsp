<!DOCTYPE html>
<html>
    <head>
        <title>Kubo | Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  		
		<link rel="stylesheet" type="text/css" href="KuboRegi.css">
		
      
        
    </head>
    
    <body>
      <div class="container" id="con1">
    		<h3 id="admin-heading" class="col-xs-offset-2"> <span>ANURAG GROUP OF INSTITUTIONS - PLACEMENT CELL</span></h3>
		<div class="row" id="row1">
			<div class="col-xs-7">
			<img src="index_bg.png" id="adminimg"/>
			</div>
		</div>
	</div>
    <%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
  <%  response.setContentType("text/html");  
%>    
   
  
    
<div class="container" id="con2">


        <form method="POST" class="form-horizontal" id="Regiform" action="RegController">
            
        
           
            <div class="form-group"> 
				<label for="userid" class="col-xs-offset-3 col-xs-2 control-label"><span>Roll No.</span></label>
				<div class="col-xs-3">
					  <input type="text" style="height:30px"  class="form-control" name="userid"  id="userid" placeholder="Enter Roll No." required/>
				</div>
			</div>
            
            <div class="form-group"> 
				<label for="password" class=" col-xs-offset-3 col-xs-2 control-label"><span>Password</span></label>
				<div class=" col-xs-3">
					  <input type="password" style="height:30px"  class="form-control" name="password"  id="password" placeholder="Enter password" required/>
				</div>
			</div>
            
            <div class="form-group"> 
				<label for="name" class=" col-xs-offset-3 col-xs-2 control-label"><span>Name</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control" name="name"  id="name" placeholder="Enter Name" required/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label for="dept" class=" col-xs-offset-3 col-xs-2 control-label"><span>Department</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control" name="dept"  id="dept" placeholder="Enter Department" required/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label for="mobile" class=" col-xs-offset-3 col-xs-2 control-label"><span>Mobile no.</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control" name="mobile" id="mobile" placeholder="Enter Mobile no." required/>
				</div>
			</div>
            
            
			<div class="form-group"> 
				<label for="mail" class=" col-xs-offset-3 col-xs-2 control-label"><span>E-mail</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control" name="mail" id="mail" placeholder="Enter E-Mail" required/>
				</div>
			</div>
               
               
            <div class="form-group"> 
				<label for="fathername" class=" col-xs-offset-3 col-xs-2 control-label"><span>Father's Name</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control" name="fathername" id="fathername" placeholder="Enter Father's name" required/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label for="mothername" class=" col-xs-offset-3 col-xs-2 control-label"><span>Mother's Name</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control"  name="mothername" id="mothername" placeholder="Enter Mother's name" required/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label for="tenth" class=" col-xs-offset-3 col-xs-2 control-label"><span>Tenth Percentage</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control"  name="tenth" id="tenth" placeholder="Enter Tenth percentage" required/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label for="inter" class=" col-xs-offset-3 col-xs-2 control-label"><span>Inter Percentage</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control"  name="inter" id="inter" placeholder="Enter Inter percentage" required/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label for="school" class=" col-xs-offset-3 col-xs-2 control-label"><span>School</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control"  name="school" id="school" placeholder="Enter School Name" required/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label for="college" class=" col-xs-offset-3 col-xs-2 control-label"><span>Inter College </span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control"  name="college" id="colege" placeholder="Enter Inter College Name" required/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label for="sem" class=" col-xs-offset-3 col-xs-2 control-label"><span>Semester</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control"  name="sem" id="sem" placeholder="Enter Semester" required/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label for="batch" class=" col-xs-offset-3 col-xs-2 control-label"><span>Batch</span></label>
				<div class=" col-xs-3">
					  <input type="text" style="height:30px"  class="form-control"   name="batch" id="batch" placeholder="Enter Batch- (2013 if 13H6..)" required/>
				</div>
			</div>
        
          <div class="form-group">
		    <label for="address" class=" col-xs-offset-3 col-xs-2 control-label"><span>Address</span></label>
		    <textarea class="form-control" name="address" rows="3" style="width:30%"></textarea>
		  </div>
			
			 <div class="form-group" style="margin-left:-10px">
					<div class="col-xs-offset-5 col-xs-1" >
					 <input type="submit" name="submit" class="regibutton" value="Register Me" id="register" />
					</div>
					
					<div class="col-xs-2">
					 <a href="login.jsp" class="regibutton" id="login" >Login</a>
					</div>
               </div> 
              
            
      
        
      </form>  
   
    
   </div>
  
   
    </body>
</html>
