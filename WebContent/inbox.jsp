<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 <!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> -->
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="nav_bar.css"/>
<link rel="stylesheet" type="text/css" href="ECG.css"/>
<title>Kubo | Mail</title>
<script>  


var request;  
function sendInfo()  
{  
var v=document.inbox.link.value; 
var id=document.inbox.sessionid.value;
var ids="<%=request.getParameter("sessionid")%>";
var url="index.jsp?val="+v+"&id="+id;  

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
/* $('#submit').click(function() {
	$.post("MailingDao", {'links': links}, 
		       function(data) 
		       { 
		          alert("Result from second.jsp: " + data.links + " " + data.type); 
		       }
		);
}); */

   /*  $('.attachments').click(function() {
    	 if($('#no').is(':checked')) { alert("it's checked");
    	 
    	 $("#link").prop("disabled","disabled");
     	$("#addlink").prop("disabled","disabled");
    	 
    	 }
    	 else{
    		 $("#link").removeProp("disabled");
    	    	$("#addlink").removeProp("disabled"); 
    	 }

       // alert($('#columnData').html());
                   
    });
    $('.attachments').click(function() {
    	 if($('#yes').is(':checked')) { alert("it's checked");$("#link").removeProp("disabled");
    	$("#addlink").removeProp("disabled");
       // alert($('#columnData').html());
    	 }           
    });
 */   
 /* $(function(){
	    $("#yes, #no").change(function(){
	        //$("#field1, #field2").val("").attr("readonly",true);
	        if($("#no").is(":checked")){
	             $("#field1").removeAttr("readonly");
	            $("#field1").focus();
  $("#link").prop("disabled","disabled");
	$("#addlink").prop("disabled","disabled");
	
 
	        }
	        else if($("#yes").is(":checked")){
	             $("#field2").removeAttr("readonly");
	            $("#field2").focus();  
	        	 $("#link").removeProp("disabled");
	    	    	$("#addlink").removeProp("disabled"); 

	        }
	    });
	});
 */  
</script>  
<script>
 $(document).ready(function() {
	 $('#attach').click(function() {
	    	
	    	$("#link").removeProp("disabled");
	       // alert($('#columnData').html());
	    $("#addlink").removeProp("disabled");
	                   
	    });
	   
    $('#attachs').click(function() {
    	$("#link").prop("disabled","disabled");
       // alert($('#columnData').html());
    	$("#addlink").prop("disabled","disabled");
                   
    });
    
});
 

 /* function inactive()
 {
             	var generate=$("#no").val();
             	alert(generate)
             	if(generate.match("no"))
             		{
             	$("#link").prop("disabled","disabled");
             		}
             	           	
             	}          
             function active()
             {
                         	var generate=$("#yes").val();
                         	alert(generate)
                         	if(generate.match("yes"))
                         		{
                         	           		$("#link").removeProp("disabled");	
                         	}    }      
             
             
             
  


 */
</script>
</head>
<body>
<% System.out.println("inbox"+request.getParameter("percent"));
System.out.println(session.getId());%>
<div class="container" id="con1">
<form name="inbox" id="ECGform" class="form-horizontal" action="MailingController" >
<input type="hidden" name="hidden" value="<%=request.getParameter("percent") %>">
<input type="hidden" name="allDepts" value=<%=request.getParameter("all") %>>
<input type="hidden" name="cseDept" value=<%=request.getParameter("cse") %>>
<input type="hidden" name="eceDept" value=<%=request.getParameter("ece") %>>
<input type="hidden" name="eeeDept" value=<%=request.getParameter("eee") %>>
<input type="hidden" name="itDept" value=<%=request.getParameter("it") %>>
<input type="hidden" name="mechDept" value=<%=request.getParameter("mech") %>>
<input type="hidden" name="civDept" value=<%=request.getParameter("civ") %>>
<input type="hidden" name="chemDept" value=<%=request.getParameter("chem") %>>
<input type="hidden" name="semester" value=<%=request.getParameter("semester") %>>
<input type="hidden" name="batch" value=<%=request.getParameter("batch") %>>
<input type="hidden" name="tenth" value=<%=request.getParameter("tenth") %>>
<input type="hidden" name="inter" value=<%=request.getParameter("inter") %>>
<input type="hidden" name="backlogs" value=<%=request.getParameter("backlogs") %>>

<input type="hidden" name="sessionid" id="sessionid" value=<%=session.getId() %>>
	
	<div class="form-group"> 
		<label for="uid" class=" col-xs-offset-3 col-xs-2 control-label"><span>Username</span></label>
		<div class=" col-xs-3">
			  <input type="email" style="height:30px" class="form-control" name="uid"   placeholder="Enter E-mail Username" required>
		</div>
	</div>
	
	<div class="form-group"> 
		<label for="pwd" class=" col-xs-offset-3 col-xs-2 control-label"><span>Password</span></label>
		<div class=" col-xs-3">
			  <input type="password" style="height:30px" class="form-control" name="pwd"   placeholder="Enter E-mail Password" required>
		</div>
	</div>
	
	<div class="form-group"> 
			<label for="attachments" class=" col-xs-offset-3 col-xs-2 control-label"><span>Have Attachements?</span>
			</label>
			<label class="radio-inline" style="margin-left:20px" >
					<input type="radio" name="attachments" class="attachments" id="attach" value="yes" onClick()="active()"required><span>Yes</span>
			</label>	
			<label class="radio-inline" style="margin-left:20px" >
				<input type="radio" name="attachments" class="attachments" id="attachs" value="no" onClick()="active()"required><span>No</span>
			</label>
	</div>
	
	<div class="form-group"> 
		<label for="subject" class=" col-xs-offset-3 col-xs-2 control-label"><span>Mail Suject</span></label>
		<div class=" col-xs-3">
			  <input type="text" style="height:30px" class="form-control" name="subject" placeholder="Enter E-mail Subject" required>
		</div>
	</div>
	
	<div class="form-group">
    <label for="body" class=" col-xs-offset-3 col-xs-2 control-label"><span>Mail Body</span></label>
    <textarea class="form-control" name="body" rows="3" style="width:30%"></textarea>
  </div>
	
	<div class="form-group"> 
		<label for="link" class=" col-xs-offset-3 col-xs-2 control-label"><span>Links</span></label>
		<div class=" col-xs-3">
			  <input type="text" style="height:30px" class="form-control" id="link" name="link" placeholder="Paste link and click Attach" required>
		</div>
		
		<div class="col-xs-2">
			   <input type="button" name="addlink"  class="admin-button" value="attach" id="addlink" style="width:70px;height:30px;margin-top:0px""onClick="sendInfo()">
		</div>
	</div>
	
	<div class="form-group" >
		<div class="col-xs-offset-6 col-xs-2">
		  <input type="submit" style="margin-left:-50px" name="submit" class="admin-button" id="submit" value="send">
		</div>
  </div>
  
  <div class="form-group">
		<div class="col-xs-offset-4 col-xs-2">
		  <span id="op" style="color:white;font-style:ps"></span>
		</div>
  </div>
 
</form>

</div>

</body>
</html>